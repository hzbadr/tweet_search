module TweetsHelper
  def search
    params["search"]
  end

  def search_count
    params["count"].to_i > 0 ? params["count"] : Twitter::SearchTerm::DEFAULT_TWEET_COUNT
  end

  def search_result_type
    params["result_type"].blank? ? Twitter::SearchTerm::DEFAULT_RESULT_TYPE : params["result_type"]
  end
end
