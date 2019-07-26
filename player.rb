class Player
    attr_accessor :name, :color

    def initialize
      @name = name
      @color = color
    end

    def name
      show("Tell me your name")
      player.name = gets.chomps
    end

    def choose_color
      show("Choose a color: either X or O")
      color = gets.chomps.upcase
      if (color != "X") || (color != "Y")
        show("Not a valid color!")
        return choose_color
      elsif (color == "X")
        player.color == color.red
      elsif (color == "O")
        player.color == color.blue
      end
    end

    def set_second_player_color(first_player_color)
      if first_player_color == "X"
        second_player_color = "O"
        second_player_color.blue
      elsif first_player_color == "O"
        second_player_color = "X"
        second_player_color.blue
      end
    end

  end

  

  module Messages
    
    def show(string)
      puts "#{string}"
    end

    def whos_first_message(first_one)
      puts "YEAH BABY! #{first_one} goes first!"
    end
    
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
