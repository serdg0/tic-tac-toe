class Output
    def greetings
        puts "#####################################"
        puts "#### WELCOME TO TIC - TAC - TOE ! ###"
        puts "#####################################"
        puts "##### created by sergio & daniel ####"
        puts "#####################################"
    end

    def gather_data
        puts "Player 1, What's your name ? "
        $player1.name = gets.chomp
        puts "\n"
        puts "X / O ?"
        $player1.color = gets.chomp.upcase
        $player2.color = $player1.color == 'X' ? 'O' : 'X'
        puts "#{$player1.name}'s weapon is : #{$player1.color}"
        puts "\n"
        puts "Player 2, What's you name ? "
        $player2.name = gets.chomp 
        puts "\n"
        puts "#{$player2.name}'s weapon is #{$player2.color}"
        puts "\n"
    end

    def first_turn
      if $player1.color == 'X'
        puts "#{$player1.name} go first"
      else
        puts "#{$player2.name} go first"
      end
        puts  ""
    end

    def turn
        puts "Your move #{$whos_turn.name}"
        puts "hit a number!"
        $new_board.player_move($whos_turn,gets.chomp.to_i, $board)
        $new_board.display_board
    end

end