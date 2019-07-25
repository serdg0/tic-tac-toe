class Board

    attr_accessor :cell, :grid

    def initialize
        @grid = grid
    end

    def grid
        (1..9).map { |x| x.to_s }
    end

    def display_board
        puts " #{grid[0]} | #{grid[1]} | #{grid[2]} "
        puts "---+---+---"
        puts " #{grid[3]} | #{grid[4]} | #{grid[5]} "
        puts "---+---+---"
        puts " #{grid[6]} | #{grid[7]} | #{grid[8]} "
        puts "\n"   
    end

    def display_board_with_player_input(input)
        show("Go on #{player}, make your move")
        player_input = gets.chomp
    end


    def is_winner(board,player)
        winning_positions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
        win = false
        winning_positions.each do |cell|
            count = 0
            cell.each do |position|
                count+=1 if  board[position-1] == player.color
            end
            win = true if count == 3
        end
        win
    end

end

test = Board.new 
puts test.display_board