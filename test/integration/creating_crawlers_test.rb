require 'test_helper'

class CreatingCrawlersTest < ActionDispatch::IntegrationTest
  test 'crawl data with valid URL' do
    post '/api/crawl_data',
         {crawler: {url: "http://www.sandimetz.com/"}}.to_json,
         {Accept: 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    crawler = JSON.parse(response.body, symbolize_names: true)
    assert_equal "http://www.sandimetz.com/", crawler[:url]
    assert_match "Sandi Metz", crawler[:h1_content]
  end

  test 'crawl data with INVALID URL' do
    post '/api/crawl_data',
         {crawler: {url: "http://www.WRONGsandimetz.com/"}}.to_json,
         {Accept: 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 404, response.status
    error = JSON.parse(response.body, symbolize_names: true)
    assert_equal error[:error_message], "Can not Open File/URL"
  end

  test 'does not create crawler with INVALID URL' do
    post '/api/crawlers',
         {crawler: {url: "", h1_content: "H1 in google.com"}}.to_json,
         {Accept: 'application/json', 'Content-Type' => 'application/json'}
    assert_equal 422, response.status
  end
end
