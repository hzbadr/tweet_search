RSpec.describe Twitter::SearchTerm do

  context "valid data" do
    it "initialize with default values" do
      term = "Hello"
      search_term = Twitter::SearchTerm.new(term)
      expect(search_term.term).to eq(term)
      expect(search_term.options).to eq(
        count: Twitter::SearchTerm::DEFAULT_TWEET_COUNT,
        result_type: Twitter::SearchTerm::DEFAULT_RESULT_TYPE
      )
    end

    it "override default values with valid data" do
      term = "Hello"
      count = 5
      result_type = "popular"
      search_term = Twitter::SearchTerm.new(term, count: count, result_type: result_type)
      expect(search_term.options).to eq(
        count: count,
        result_type: result_type
      )
    end
  end

  context "invali data" do
    it "set default values if invalid data entered | negative tweet count" do
      term = "Hello"
      count = -5
      result_type = "xyz"
      search_term = Twitter::SearchTerm.new(term, count: count, result_type: result_type)
      expect(search_term.options).to eq(
        count: Twitter::SearchTerm::DEFAULT_TWEET_COUNT,
        result_type: Twitter::SearchTerm::DEFAULT_RESULT_TYPE
      )
    end

    it "set default values if invalid data entered | tweet count not a number" do
      term = "Hello"
      count = "hello"
      result_type = "xyz"
      search_term = Twitter::SearchTerm.new(term, count: count, result_type: result_type)
      expect(search_term.options).to eq(
        count: Twitter::SearchTerm::DEFAULT_TWEET_COUNT,
        result_type: Twitter::SearchTerm::DEFAULT_RESULT_TYPE
      )
    end
  end
end
