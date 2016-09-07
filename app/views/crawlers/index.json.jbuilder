json.array!(@crawlers) do |crawler|
  json.extract! crawler, :id, :url, :h1_content, :h2_content, :h3_content, :link_content, :term
  json.url crawler_url(crawler, format: :json)
end
