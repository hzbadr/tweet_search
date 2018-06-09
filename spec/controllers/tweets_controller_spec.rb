require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  render_views

  context "Twitter not reachable" do
    before do
      def controller.index
        raise Twitter::NotReachableError, "Twitter is not reachable at the moment"
      end
    end

    it "display error message when Twitter is not reachable" do
      get :index
      expect(response.body).to match /Twitter is not reachable at the moment/i
      expect(response).to render_template(partial: "tweets/_error")
    end
  end

  context "valid search" do
    it "it succeed" do
      client = double("client")
      allow(client).to receive("call") { [
        OpenStruct.new(user: OpenStruct.new(name: "User 1"), text: "Tweet text 1", favorite_count: 1, retweet_count: 0),
        OpenStruct.new(user: OpenStruct.new(name: "User 2"), text: "Tweet text 3", favorite_count: 2, retweet_count: 1),
        OpenStruct.new(user: OpenStruct.new(name: "User 3"), text: "Tweet text 3", favorite_count: 0, retweet_count: 2),
      ]}
      allow(Tweet::Search).to receive(:new) { client }

      get :index
      expect(response.status).to eq(200)
    end
  end
end
