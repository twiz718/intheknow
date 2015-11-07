require 'open-uri'
require './lib/article.rb'

class CNN
  attr :articles

  def initialize
    @articles = []
  end

  def get_articles_html(from_file = nil)
    if !from_file 
      @articles_html = open("http://www.cnn.com").read
    else
      @articles_html = File.read(from_file)
    end
    populate_articles_from_html
  end


  private
  attr :articles_html
  
  def populate_articles_from_html
    if !@articles_html.empty?
      matches = @articles_html.scan(/<a href="(.*?)".*?><span class="cd__headline-text">(.*?)</)
      matches.each do |article_match|
        url = article_match[0]
        if url !~ /http:/
          url = "http://www.cnn.com" + url
        end
        @articles << Article.new(article_match[1], url)
      end
    end
  end
end
