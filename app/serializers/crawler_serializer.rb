class CrawlerSerializer < ActiveModel::Serializer
  attributes :id, :url, :link_content, :h1_content, :h2_content, :h3_content, :term
end
