RSpec.describe Googlebooksclient do

  let(:client) { Googlebooksclient::Client.new }

  it "has a version number" do
    expect(Googlebooksclient::VERSION).not_to be nil
  end

  it "initializes without an access token" do
    expect(client).to be_an_instance_of(Googlebooksclient::Client)
  end

  it "initializes with an access token" do
    expect(Googlebooksclient::Client.new("helloworld")).to be_an_instance_of(Googlebooksclient::Client)
  end

  it "returns nil for empty response" do
    stub_request(:get, "https://www.googleapis.com/books/v1/volumes?q=").to_return(body: "")
    expect(client.volumes).to eql(nil)
  end

  describe "Client" do

    let(:response) do
      {
        "kind"=>"books#volumes",
        "totalItems"=>3017,
        "items"=>
          [
            {
              "kind"=>"books#volume",
              "id"=>"yngEsxEO4QYC",
              "etag"=>"MlMCDbM2V7Y",
              "selfLink"=>"https://www.googleapis.com/books/v1/volumes/yngEsxEO4QYC"
            },
            {
              "kind"=>"books#volume",
              "id"=>"NyUw8nbEnGQC",
              "etag"=>"pcVSTU3FEzI",
              "selfLink"=>"https://www.googleapis.com/books/v1/volumes/NyUw8nbEnGQC"
            }
          ]
      }.to_json
    end

    let(:error_response) do
      {
      "error"=>
      {
      "errors"=>
        [{
        "domain"=>"global",
        "reason"=>"queryRequired",
        "message"=>"Missing query.",
        "locationType"=>"parameter",
        "location"=>"q"
        }],
      "code"=>400,
      "message"=>"Missing query."
      }}.to_json
    end

    describe ".volumes" do
      it "returns a parsed response from Google Books" do
        stub_request(:get, "https://www.googleapis.com/books/v1/volumes?q=The%2BGreat%2BHunt").to_return(body: response)
        res = JSON.parse(response)
        expect(client.volumes("The Great Hunt")).to eql(res["items"])
      end

      it "returns an array of items" do
        stub_request(:get, "https://www.googleapis.com/books/v1/volumes?q=The%2BGreat%2BHunt").to_return(body: response)
        res = JSON.parse(response)
        expect(client.volumes("The Great Hunt")).to be_an_instance_of(Array)
      end

      it "returns nil rather than throw an error" do
        stub_request(:get, "https://www.googleapis.com/books/v1/volumes?q=").to_return(body: error_response)
        expect(client.volumes("")).to eql(nil)
      end
    end

    describe ".add_filters" do
      let(:filter_params) { {"inauthor": "keyes", "intitle": "flowers"} }
      it "takes in a Hash and returns a string" do
        expect(client.add_filters(filter_params)).to be_an_instance_of(String)
      end
    end
  end
end
