module Twitter
  class RestClient
    def self.client
      twitter_credentials = Rails.application.credentials[Rails.env.to_sym][:twitter]

      Twitter::REST::Client.new do |config|
        config.consumer_key = twitter_credentials[:consumer_key]
        config.consumer_secret = twitter_credentials[:consumer_secret]
      end
    end
  end
end
