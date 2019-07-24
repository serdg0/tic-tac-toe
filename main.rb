require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'output.rb'

def game_reset
    $new_board = Board.new
    new_output = Output.new
    new_output.greetings
    $player1 = Player.new
    $player2 = Player.new
    new_output.gather_data
    $turn_count = 0
    $whos_turn = $turn_count % 2 == 0 ? $player1 : $player2 
    new_output.first_turn
    $new_board.display_board

    while !$new_board.is_winner($board, $whos_turn)
        #$first_turn = $turn_count % 2 == 0 ? $player1 : $player2
        new_output.turn
    end
end

class Game
    game_reset
    puts "Another round? y/n"
    answer = gets.chomp.upcase
    answer == "Y" ? Game.new : (puts "Thanks for playing!")
end

Game.new

