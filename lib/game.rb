class Game

  attr_accessor :board, :who_won, :players

  def initialize
    @board = Board.new
    @who_won = false
  end

  def draw_board
    system 'clear'
    puts "     |     |      "
    puts "  #{ @board[0] }  |  #{ @board[1] }  |  #{ @board[2] }"
    puts "_____|_____|_____"
    puts "     |     |    "
    puts "  #{ @board[3] }  |  #{ @board[4] }  |  #{ @board[5] }"
    puts "_____|_____|_____"
    puts "     |     |    "
    puts "  #{ @board[6] }  |  #{ @board[7] }  |  #{ @board[8] }"
    puts "     |     |    "
  end

  def play(players)
    @players = players
    9.times do |i|
      draw_board if players[i % 2].is_a? HumanPlayer
      players[i % 2].mark_the_board(board)
      @who_won = players[i % 2] if anybody_win?
      break if who_won
    end
  end

  def anybody_win?
    board.get_all_diagonals_rows_and_columns.each {|x| return true if x.uniq.size == 1}
    false
  end

  def introduce_game
    system 'clear'
    puts "Welcome to Tic-Tac-Toe!"
    puts "\nRules:"
    puts "  -You may not mark a region that has already been marked"
    puts "  -You win by getting 3 of your mark (an 'X' or an 'O') in a row"
    puts "  -This can be done horizontally, vertically, or diagonally."
    puts "\nNow that you know the rules, you're ready to play the game!\n"
  end

  def play_against_friend_or_cpu?
    puts "\nWould you like to play against a friend (option 1)"
    puts "or against the computer (option 2)?\n"
    player_classes = false
    until player_classes
      user_input = gets.chomp
      if user_input == "1"
        player_classes = HumanPlayer, HumanPlayer
      elsif user_input == "2"
        player_classes = HumanPlayer, ComputerPlayer
      else
        puts "Please enter a 1 (for a human opponent) or a 2 (for a computer opponent)."
      end
    end
    player_classes = who_goes_first?(player_classes) if player_classes.include? ComputerPlayer
    player_classes
  end

  def who_goes_first?(player_classes)
    puts "\nWould you like to go first?"
    while true
      user_input = gets.chomp
      if user_input[0] == 'y'
        return player_classes
      elsif user_input[0] == 'n'
        return player_classes.reverse
      else
        puts "Please enter yes or no"
      end
    end
  end

  def game_over
    system ('clear')
    draw_board
    puts "#{who_won.which_player}'s win!" if who_won
    puts 'It was a tie!' unless who_won
    if players.map{|x| x.class}.include? ComputerPlayer
      if who_won.is_a? ComputerPlayer
        puts "Tough luck, whoever you are."
        puts "...Especially because now that Skynet has mastered Tic-Tac-Toe, "
        puts "it will focus on global conquest!"
        puts "...Unless you'd like to play again that is..."
      elsif who_won
        puts "Good job, whoever you are!"
        puts "But beware... every time Skynet loses, it becomes smarter..."
      end
    elsif who_won
      puts "Good job, #{who_won.which_player}'s!"
      puts "Better luck next time, #{who_won.which_player == 'X' ? 'O' : 'X'}'s."
    end
  end

  def want_to_play_again?
    puts "\nWould you like to play again?"
    while true
      input = gets.chomp
      if input[0] == 'y'
        return true
      elsif input[0] == 'n'
        return false
      else
        puts "Please enter yes or no"
      end
    end
  end

end
