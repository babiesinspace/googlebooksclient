require "httparty"
require "googlebooksclient/client/volumes"

module Googlebooksclient

  class Client
    include HTTParty
    include Googlebooksclient::Client::Volumes
    base_uri "https://www.googleapis.com/books/v1"
    format :json

    def initialize(access_token = nil)
      access_token ||= ENV["GOOGLEBOOKS_ACCESS_TOKEN"]
      if !access_token.nil?
        self.class.default_options.merge!(headers: { 'Authorization' => "Bearer #{access_token}" })
      end
    end

  end

end
