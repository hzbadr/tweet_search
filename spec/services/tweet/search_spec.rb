RSpec.describe Tweet::Search do
  before(:each){
    @client = double('client')
    @params = {"search" => "Hello"}
  }

  context "having result" do
    it "return the tweets" do
      allow(@client).to receive("search").and_return([
        {user: {name: "User 1"}, text: "Tweet text 1", favorite_count: 1, retweet_count: 0},
        {user: {name: "User 2"}, text: "Tweet text 3", favorite_count: 2, retweet_count: 1},
        {user: {name: "User 3"}, text: "Tweet text 3", favorite_count: 0, retweet_count: 2},
      ])
      tweets = Tweet::Search.new(@params,client: @client).call
      expect(tweets.count).to eq(3)
    end
  end

  context "empty result" do
    it "return no tweets if no search term provided" do
      allow(@client).to receive("search").and_return([
        { user: { name: "User 1" }, text: "Tweet text 1", favorite_count: 1, retweet_count: 0 },
        { user: { name: "User 2" }, text: "Tweet text 3", favorite_count: 2, retweet_count: 1 },
        { user: { name: "User 3" }, text: "Tweet text 3", favorite_count: 0, retweet_count: 2 },
      ])
      tweets = Tweet::Search.new({}, client: @client).call
      expect(tweets.count).to eq(0)
    end

    it "return no tweets" do
      allow(@client).to receive("search").and_return([])
      tweets = Tweet::Search.new(@params, client: @client).call
      expect(tweets.count).to eq(0)
    end
  end

  context "client is not reachable" do
    it "raise exception if something wrong happened" do
      allow(@client).to receive("search").and_raise("Exception")
      expect { Tweet::Search.new(@params, client: @client).call }.to raise_error(Twitter::NotReachableError)
    end
  end
end
