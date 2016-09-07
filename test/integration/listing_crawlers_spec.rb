require 'rails_helper'

RSpec.describe "ListingCrawlers", type: :request do

  setup do
    Crawler.create!(url: "http://google.com.vn", h1_content: "H1 Content")
    Crawler.create!(url: "http://fptshop.com.vn", h1_content: "H1 Content")
    Crawler.create!(url: "http://thegioididong.com", h1_content: "H1 Content")
  end

  # describe "GET" do
  #   it "all crawlers" do
  #     get api_crawlers_url
  #     expect(response).to be_success
  #     assert_equal Mime::JSON, response.content_type
  #     assert_equal Crawler.count, JSON.parse(response.body).size
  #   end
  # end
end
