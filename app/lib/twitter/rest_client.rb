module Twitter
  class RestClient
    def self.client
      twitter_credentials = Rails.application.credentials[Rails.env.to_sym][:twitter]

      Twitter::REST::Client.new do |config|
        config.consumer_key = twitter_credentials[:consumer_key] #"qQiz5UjiO1uSzAALlnt6awDRw"
        config.consumer_secret = twitter_credentials[:consumer_secret] #"DvcJkMiUhGkNZfJxF0kx5xnwQuHk80mIMAPCTqyOKpxQ0MaF4L"
      end
    end
  end
end
