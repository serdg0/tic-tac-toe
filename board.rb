#require_relative 'player.rb'
class Board
    #include Messages

    def initialize
        @grid = [[1,2,3],[4,5,6],[7,8,9]]
        @grid_accessor = {
            1 => @grid[0][0],
            2 => @grid[0][1],
            3 => @grid[0][2],
            4 => @grid[1][0],
            5 => @grid[1][1],
            6 => @grid[1][2],
            7 => @grid[2][0],
            8 => @grid[2][1],
            9 => @grid[2][2]
        }
        @cells = {
            1 => false,
            2 => false,
            3 => false,
            4 => false,
            5 => false,
            6 => false,
            7 => false,
            8 => false,
            9 => false
        }
    end

    def display_board
        puts " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]} "
        puts "---+---+---"
        puts " #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]} "
        puts "---+---+---"
        puts " #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]} "
        puts "\n"   
    end
    
    def ask_for_move(player)
        show("Go on #{player.name}, make your move")
    end

    def player_input
        return input = gets.chomp
    end

    def display_board_with_player_input(player_input)
        if (1..9).include? player_input && @cells[player_input] == false
            @grid_accessor[player_input] = player.color #how am i going to acces the player on this method?
            @cells.update(@cells) { |key,value| value = true if key == player_input }
        else
            show("Not a valid move bro")
            ask_for_move(player)
        end
    end



end

test = Board.new

puts test.display_board
#test.ask_for_move
#puts test.display_board_with_player_input