module Twitter
  class RestClient
    attr_reader :client
    def initialize
      twitter_credentials = Rails.application.credentials[Rails.env.to_sym][:twitter]

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = twitter_credentials[:consumer_key]
        config.consumer_secret = twitter_credentials[:consumer_secret]
      end
    end

    def search(term, options)
      client.search(term, options)
    end
  end
end
