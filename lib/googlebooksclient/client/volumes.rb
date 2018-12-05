# require 'byebug'

module Googlebooksclient

  class Client

    module Volumes

      def volumes(search_term = "", options = {})
        query = search_term.split(" ").join("+")
        if !options.empty?
          query += add_filters(options)
        end
        response = self.class.get("/volumes", {query: { q: query } })
        response.parsed_response ? response.parsed_response["items"] : nil
      end

      def add_filters(filter_params)
        # take a hash of search terms and format them into a string
        query_string = ""
        filter_params.keys.each do |filter|
          term = filter_params[filter]
          term = term.split(" ").join("+")
          formatted_search_term = "+" + filter.to_s + ":" + term
          query_string += formatted_search_term
        end
        query_string
      end

    end

  end
end
