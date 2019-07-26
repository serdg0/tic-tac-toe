require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'output.rb'

class Game
    include Messages
    def initialize(player_1, player_2, board)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        @turn = 0
        @this_turn = this_turn
    end

    def first_turn(player_1, player_2)
        first = [player_1, player_2].shuffle.shift
        second = (first == player_1 ? player_2 : player_1)
        whos_first_message(first)
    end

    def turn
        @turn
    end

    def turn_count
        @turn+=1
    end

    def is_turn_even?
        @turn % 2 == 0 ? true : false
    end

    def draw?
        true if @turn == 9
    end

    def current_turn
        is_turn_even? ? player_1.this_turn : player_2.this_turn
    end


end
=begin
def class Start
    def initialize(game)
        @game = game
    end
    ask player names
    start board
    ask for moves until it reaches 9 on that case is a draw
    check is theres a winner in each move 
    game over

    while @turn !=10 
        ask for move 
        check if theres winner
        if there is one, break
        change person (turn_count)
    end
    draw
end
=end
player_1 = Player.new
player_2 = Player.new
board = Board.new
game = Game.new(player_1, player_2, board)
game.ask_for_move(player_1)