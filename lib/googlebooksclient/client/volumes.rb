module Googlebooksclient

  class Client

    module Volumes

      def volumes(options = "")
        response = self.class.get("/volumes", {query: { q: options.split(" ").join("+") } })
        response.parsed_response["items"]
      end

    end

  end
end
