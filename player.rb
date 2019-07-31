class Player
    attr_accessor :name, :color
end

class String 
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def blue 
    colorize(34)
  end

  def blink
    colorize(1)
  end

  def yellow
    colorize(93)
  end

  def red_background
    colorize(101)
  end

  def white
    colorize(37)
  end

end
