#require_relative 'player.rb'
class Board

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

    def new_board
        puts " #{@grid_accessor[1]} | #{@grid_accessor[2]} | #{@grid_accessor[3]} "
        puts "---+---+---"
        puts " #{@grid_accessor[4]} | #{@grid_accessor[5]} | #{@grid_accessor[6]} "
        puts "---+---+---"
        puts " #{@grid_accessor[7]} | #{@grid_accessor[8]} | #{@grid_accessor[9]} "
        puts "\n"   
    end

    def check_cell_occupied?(input)
        return @cells[input]
    end

    def return_board_input(input,current_player)
            @grid_accessor[input] = current_player.color
            @cells[input] = true
            return new_board
    end

    def check_winner?(current_player)
        winner_cases = [ [@grid_accessor[1],@grid_accessor[2],@grid_accessor[3]],
         [@grid_accessor[4],@grid_accessor[5],@grid_accessor[6]],
         [@grid_accessor[7],@grid_accessor[8],@grid_accessor[9]],
         [@grid_accessor[1],@grid_accessor[4],@grid_accessor[7]],
         [@grid_accessor[2],@grid_accessor[5],@grid_accessor[8]],
         [@grid_accessor[3],@grid_accessor[6],@grid_accessor[9]],
         [@grid_accessor[1],@grid_accessor[5],@grid_accessor[9]],
         [@grid_accessor[3],@grid_accessor[5],@grid_accessor[7]] ]
        
         winner_cases.each do |x|
            return true if x.all? { |icon| icon == current_player.color }
        end
        
    end

end

