module Googlebooksclient

  class Client

    def initialize(access_token = nil)
      @access_token = access_token || ENV["GOOGLEBOOKS_ACCESS_TOKEN"]
    end

    def perform_request(path)
      url = "https://www.googleapis.com/books/v1/volumes?q=#{path}"
      response = HTTParty.get(url)
      JSON.parse(response.body)
    end
  end

end
