class Crawler < ActiveRecord::Base

  validates :url, presence: true

  def crawl_data
    data = Nokogiri::HTML(open(url))
    self.h1_content = data.css('h1').text
    self.h2_content = data.css('h2').text
    self.h3_content = data.css('h3').text
    self.link_content = data.css('a').map { |link| link['href'] }
  end


end
