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

    end

  end
end
