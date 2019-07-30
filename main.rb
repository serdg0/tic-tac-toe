require_relative 'player.rb'
require_relative 'board.rb'

class Game
    attr_accessor :turn, :player_1, :player_2, :board

    def initialize(player_1 = nil, player_2 = nil, board = nil)
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

    def play_again
        puts "Another game? y/n"
        input = gets.chomp.downcase
        if input == "y"
            player_one = Player.new
            player_two = Player.new
            main_board = Board.new
            main_game = Game.new(player_one, player_two, main_board) 
            TicTacToe.new(main_game)
        else
            puts "Bye bye!"
        end
    end
end

class TicTacToe
    attr_accessor :game

    def initialize(game)
        @game = game
    end
   
    current_player = @game.set_players
    @game.display_board

    while @game.turn <= 9
        if @game.turn == 9
            @game.draw
            break
        end
        input = @game.get_input
        @game.switch_board(input,current_player)
        if @game.winner?(current_player)
            puts "#{current_player} WINS!" 
            print "      --------> #{@game.display_board}"
            break
        end
        @game.display_board
        @game.turn_count
        current_player = (current_player == @player_1 ? @player_2 : @player_1)
    end
    @game.play_again
end

player_one = Player.new
player_two = Player.new
main_board = Board.new
main_game = Game.new(player_one, player_two, main_board) 
TicTacToe.new(main_game)
