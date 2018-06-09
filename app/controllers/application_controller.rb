class ApplicationController < ActionController::Base

  rescue_from Twitter::NotReachableError do |e|
    @error_message = e.message
    render 'tweets/index'
  end
end
