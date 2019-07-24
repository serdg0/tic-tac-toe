class Board
    $board = ['1','2','3','4','5','6','7','8','9']

    def board
      $board
    end

    def display_board
        puts " #{$board[0]} | #{$board[1]} | #{$board[2]} "
        puts "---+---+---"
        puts " #{$board[3]} | #{$board[4]} | #{$board[5]} "
        puts "---+---+---"
        puts " #{$board[6]} | #{$board[7]} | #{$board[8]} "
        puts "\n"   
    end

    def player_move(player,move,board)
        if $board[move-1] != @color
            board[move-1] = player.color
            if $new_board.is_winner($board,player)
                puts "#{player.name}, You WIN!"
            end
        end
        $turn_count+=1    
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

    