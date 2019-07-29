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
end
