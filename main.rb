require_relative 'player.rb'
require_relative 'board.rb'

class Game
    attr_accessor :turn
    def initialize(player_1 = Player.new, player_2 = Player.new, board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        @turn = 0
    end

    def set_players
        puts "What's your name?"
        @player_1.name = gets.chomp
        @player_1.color = "X".red
        puts "Your icon is #{@player_1.color}. You will make the first shot"
        puts "And your name?"
        @player_2.name = gets.chomp
        @player_2.color = "O".blue
        puts "Your icon is #{@player_2.color}. You will go second"
        return @player_1
    end

    def turn
        @turn
    end

    def turn_count
        @turn+=1
    end

    def draw
        puts "This is a draw"
    end

    def get_input
        puts "Make a shot"
        input = gets.chomp
        array = [1,2,3,4,5,6,7,8,9]
        if array.include?(input.to_i)
            input.to_i
        else
            puts "Not a valid input, put another one"
            return get_input
        end
    end

    def switch_board(input, current_player)
        @board.return_board_input(input,current_player)
    end

    def winner?(current_player)
        @board.check_winner?(current_player)
    end

    def display_board
        @board.new_board
    end
end

class TicTacToe
    
    game = Game.new
    current_player = game.set_players
    game.display_board
    while game.turn <= 9
        input = game.get_input
        game.switch_board(input,current_player)
        puts "#{current_player} WINS!" if game.winner?(current_player)
        game.display_board
        turn_count
        current_player = (current_player == player_1 ? player_2 : player_1)
    end
    game.draw
end

TicTacToe.new


