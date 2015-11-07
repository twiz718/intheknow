require 'open-uri'
require './providers/cnn.rb'

include AnsiColors

cnn = CNN.new
#cnn.get_articles_html('cnn.html')
cnn.get_articles_html
#puts cnn.articles.collect(&:to_html)
puts cyan("CNN")
puts "---"
puts cnn.articles.collect(&:to_ansi)
