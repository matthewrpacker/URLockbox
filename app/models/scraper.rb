require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

  def header
    head = data.at_css "h1"
    head.text
  end

  def title
    title = data.at_css "title"
    title.text
  end

  def paragraph
    para = data.at_css "p"
    para.text
  end

  def summary
    h1 = data.at_css "h1"

    h1 ? header : paragraph
  end

  def message
    "Visit #{self.title} and enjoy!  #{self.summary}"
  end
end
