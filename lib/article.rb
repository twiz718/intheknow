require './lib/ansi_colors.rb'

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
