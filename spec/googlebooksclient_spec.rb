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
        "kind"=>"books#volume",
        "id"=>"yngEsxEO4QYC",
        "etag"=>"MlMCDbM2V7Y",
        "selfLink"=>"https://www.googleapis.com/books/v1/volumes/yngEsxEO4QYC",
        "volumeInfo"=>
        {
          "title"=>"The Great Hunt",
          "subtitle"=>"Book Two of 'The Wheel of Time'",
          "authors"=>["Robert Jordan"],
          "publisher"=>"Tor Books",
          "publishedDate"=>"2009-11-17",
          "description"=>"The Wheel of Time ® is a PBS Great American Read Selection! Now in development for TV! Since its debut in 1990, The Wheel of Time® by Robert Jordan has captivated millions of readers around the globe with its scope, originality, and compelling characters. The Wheel of Time turns and Ages come and go, leaving memories that become legend. Legend fades to myth, and even myth is long forgotten when the Age that gave it birth returns again. In the Third Age, an Age of Prophecy, the World and Time themselves hang in the balance. What was, what will be, and what is, may yet fall under the Shadow. For centuries, gleemen have told the tales of The Great Hunt of the Horn. So many tales about each of th Hunters, and so many Hunters to tell of...Now the Horn itself is found: the Horn of Valere long thought only legend, the Horn which will raise the dead heroes of the ages. And it is stolen. TV series update: \"Sony will produce along with Red Eagle Entertainment and Radar Pictures. Rafe Judkins is attached to write and executive produce. Judkins previously worked on shows such as ABC’s “Agents of SHIELD,” the Netflix series “Hemlock Grove,” and the NBC series “Chuck.” Red Eagle partners Rick Selvage and Larry Mondragon will executive produce along with Radar’s Ted Field and Mike Weber. Darren Lemke will also executive produce, with Jordan’s widow Harriet McDougal serving as consulting producer.\" —Variety The Wheel of Time® New Spring: The Novel #1 The Eye of the World #2 The Great Hunt #3 The Dragon Reborn #4 The Shadow Rising #5 The Fires of Heaven #6 Lord of Chaos #7 A Crown of Swords #8 The Path of Daggers #9 Winter's Heart #10 Crossroads of Twilight #11 Knife of Dreams By Robert Jordan and Brandon Sanderson #12 The Gathering Storm #13 Towers of Midnight #14 A Memory of Light By Robert Jordan and Teresa Patterson The World of Robert Jordan's The Wheel of Time By Robert Jordan, Harriet McDougal, Alan Romanczuk, and Maria Simons The Wheel of Time Companion By Robert Jordan and Amy Romanczuk Patterns of the Wheel: Coloring Art Based on Robert Jordan's The Wheel of Time At the Publisher's request, this title is being sold without Digital Rights Management Software (DRM) applied.",
          "industryIdentifiers"=>
          [
            {
              "type"=>"ISBN_13",
              "identifier"=>"9781429960137"
            }, {
              "type"=>"ISBN_10",
              "identifier"=>"1429960132"
            }
          ],
          "readingModes"=>
          {
            "text"=>true,
            "image"=>false
          },
            "pageCount"=>624,
            "printType"=>"BOOK",
            "categories"=>["Fiction"],
            "averageRating"=>5.0,
            "ratingsCount"=>5,
            "maturityRating"=>"NOT_MATURE",
            "allowAnonLogging"=>true,
            "contentVersion"=>"0.12.14.0.preview.2",
            "imageLinks"=>{
              "smallThumbnail"=>"http://books.google.com/books/content?id=yngEsxEO4QYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
              "thumbnail"=>"http://books.google.com/books/content?id=yngEsxEO4QYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
            },
              "language"=>"en",
              "previewLink"=>"http://books.google.com/books?id=yngEsxEO4QYC&printsec=frontcover&dq=The%2BGreat%2BHunt&hl=&cd=1&source=gbs_api",
              "infoLink"=>"https://play.google.com/store/books/details?id=yngEsxEO4QYC&source=gbs_api",
              "canonicalVolumeLink"=>"https://market.android.com/details?id=book-yngEsxEO4QYC"
            },
            "saleInfo"=>{
              "country"=>"US",
            "saleability"=>"FOR_SALE",
            "isEbook"=>true,
            "listPrice"=>
            {
              "amount"=>9.99, "currencyCode"=>"USD"
            },
            "retailPrice"=>
              {
                "amount"=>9.99,
                "currencyCode"=>"USD"
              },
            "buyLink"=>"https://play.google.com/store/books/details?id=yngEsxEO4QYC&rdid=book-yngEsxEO4QYC&rdot=1&source=gbs_api",
            "offers"=>
              [
                {
                "finskyOfferType"=>1,
                "listPrice"=>
                {
                  "amountInMicros"=>9990000.0,
                  "currencyCode"=>"USD"
                },
                "retailPrice"=>
                {
                  "amountInMicros"=>9990000.0,
                  "currencyCode"=>"USD"
                },
                "giftable"=>true
                }
              ]
            },
            "accessInfo"=>
            {
              "country"=>"US",
              "viewability"=>"PARTIAL",
              "embeddable"=>true,
              "publicDomain"=>false,
              "textToSpeechPermission"=>"ALLOWED",
              "epub"=>
              {
                "isAvailable"=>true
              },
              "pdf"=>
              {
                "isAvailable"=>false
              },
              "webReaderLink"=>"http://play.google.com/books/reader?id=yngEsxEO4QYC&hl=&printsec=frontcover&source=gbs_api",
              "accessViewStatus"=>"SAMPLE",
              "quoteSharingAllowed"=>false
            },
            "searchInfo"=>
            {
              "textSnippet"=>"Darren Lemke will also executive produce, with Jordan’s widow Harriet McDougal serving as consulting producer.&quot; —Variety The Wheel of Time® New Spring: The Novel #1 The Eye of the World #2 The Great Hunt #3 The Dragon Reborn #4 The ..."
            }
          }.to_json
    end
    describe ".volumes" do
      it "takes a query string as a parameter" do
        stub_request(:get, "https://www.googleapis.com/books/v1/volumes?q=The%2BGreat%2BHunt").to_return(body: response)
        expect(client.volumes("The Great Hunt")).to eql(response)
      end
    end
  end
end
