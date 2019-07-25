require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'output.rb'

class Game

    attr_accessor :player_1 :player_2

    def initialize(player_1, player_2, board)
        @player_1 = player_1
        @player_2 = player_2
        @board = Board.new
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
