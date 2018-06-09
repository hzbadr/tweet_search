class TweetsController < ApplicationController

  def index
    @tweets = Tweet::Search.new(params).call
  end
end
