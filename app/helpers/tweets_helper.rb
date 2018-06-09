module TweetsHelper 
  def search
    params["search"]
  end

  def search_count
    params["count"].blank? ? Twitter::SearchTerm::DEFAULT_TWEET_COUNT : params["count"]
  end

  def search_result_type
    params["result_type"].blank? ? Twitter::SearchTerm::DEFAULT_RESULT_TYPE : params["result_type"] 
  end
end