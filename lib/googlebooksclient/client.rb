module Googlebooksclient

  class Client

    def initialize(access_token = nil)
      @access_token = access_token || ENV["GOOGLEBOOKS_ACCESS_TOKEN"]
    end

  end

end
