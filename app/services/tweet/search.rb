module Tweet
  class Search
    def initialize(params, search_term_class: Twitter::SearchTerm, client: Twitter::RestClient.client)
      @client = client
      @search_term = search_term_class.new(params["search"],
                                          result_type: params["result_type"],
                                          count: params["count"])
    end

    def call
      return [] if @search_term.term.blank?

      # The client has has a bug. It doesn not return the correct count.
      @client.search(@search_term.term, @search_term.options).take(@search_term.count)
    rescue
      raise Twitter::NotReachableError, I18n.t("not_reachable")
    end
  end
end
