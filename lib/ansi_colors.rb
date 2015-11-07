module AnsiColors

  MAGENTA = "\033[0;35m"
  CYAN    = "\033[0;36m"
  GREEN   = "\033[0;32m"
  RED     = "\033[0;31m"
  BLUE    = "\033[0;34m"
  YELLOW  = "\033[0;33m"
  OFF     = "\033[0m"

  def colorize(text, color)
    "#{color}#{text}#{AnsiColors::OFF}"  
  end

  def cyan(text)
    colorize(text, AnsiColors::CYAN)
  end

  def magenta(text)
    colorize(text, AnsiColors::MAGENTA)
  end

  def red(text)
    colorize(text, AnsiColors::RED)
  end

  def green(text)
    colorize(text, AnsiColors::GREEN)
  end

  def blue(text)
    colorize(text, AnsiColors::BLUE)
  end

  def yellow(text)
    colorize(text, AnsiColors::YELLOW)
  end

end
