module Twitter
  class SearchTerm
    DEFAULT_TWEET_COUNT = 10
    DEFAULT_RESULT_TYPE = "recent"

    RESULT_TYPES = %w(recent popular mixed)

    attr_reader :term

    def initialize(term, result_type: DEFAULT_RESULT_TYPE, count: DEFAULT_TWEET_COUNT)
      @term = term
      @result_type = result_type
      @count = count.to_i
    end

    def options
      @options = {
        count: count,
        result_type: result_type
      }
    end

    def count
      @count > 0 ? @count : DEFAULT_TWEET_COUNT
    end

    private
      def result_type
        RESULT_TYPES.include?(@result_type) ? @result_type : DEFAULT_RESULT_TYPE
      end
  end
end
