require 'open-uri'
require './ansi_colors.rb'

include AnsiColors

class Article
  attr :title, :link

  def initialize(title, link)
    @title, @link = title, link
  end

  def to_html
    "<a href=\"#{@link}\">#{@title}</a>"
  end

  def to_ansi(prefix_with_tab = true)
    (prefix_with_tab ? "\t" : "") + "#{yellow(@title)} [#{magenta(@link)}]" 
  end
end

class CNN
  attr :articles

  def initialize
    @articles = []
  end

  def get_articles_html(from_file = '')
    if !from_file.empty?
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

cnn = CNN.new
cnn.get_articles_html('cnn.html')
#puts cnn.articles.collect(&:to_html)
puts cyan("CNN")
puts "---"
puts cnn.articles.collect(&:to_ansi)
