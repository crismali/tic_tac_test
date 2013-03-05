module Setup

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
    player_2_class = false
    until player_2_class
      user_input = gets.chomp

      if user_input == "1"
        player_2_class = HumanPlayer
      elsif user_input == "2"
        player_2_class = ComputerPlayer
      else
        puts "Please enter a 1 (for a human opponent) or a 2 (for a computer opponent)."
      end
    end
    return player_2_class
  end

  def who_goes_first?
    puts "\nWould you like to go first?"
    puts "(enter 1 for yes or 2 for no)"

    while true
      user_input = gets.chomp
      if user_input == '1'
        return HumanPlayer
      elsif user_input == '2'
        return ComputerPlayer
      else
        puts "Please enter a 1 (to go first) or a 2 (to go second)"
      end
    end

  end

  def game_over(opponent_class, who_goes_first)
    system ('clear')
    draw_board

    puts "#{@who_won}'s win!" unless @who_won == true

    if @who_won == true
       puts 'It was a draw!'
    elsif opponent_class == HumanPlayer
      puts 'Good job, player 1' if @who_won == 'X'
      puts 'Good job, player 2' if @who_won == 'O'
      puts 'Better luck next time, player 1' if @who_won == 'O'
      puts 'Better luck next time, player 2' if @who_won == 'X'
    elsif opponent_class == ComputerPlayer
      if @who_won == 'X'
        if who_goes_first == ComputerPlayer
          puts "Tough luck, whoever you are"
          puts "Especially because now that Skynet has mastered Tic-Tac-Toe, "
          puts "it will focus on global conquest!"
        else
          puts "Good job, whoever you are!"
          puts "But beware... every time Skynet loses, it becomes smarter..."
        end
      elsif @who_won == 'O'
        if who_goes_first == HumanPlayer
          puts "Tough luck, whoever you are"
          puts "Especially because now that Skynet has mastered Tic-Tac-Toe, "
          puts "it will focus on global conquest!"
        else
          puts "Good job, whoever you are!"
          puts "But beware... every time Skynet loses, it becomes smarter..."
        end

      end
    end

  end

  def want_to_play_again?
    puts 'Would you like to play again?'
    puts '(1 for yes, 2 for no)'

    while true
      input = gets.chomp
      if input == '2'
        return false
      elsif input == '1'
        return true
      else
        puts 'Invalid input: please enter a 1 for yes or a 2 for no.'
      end
    end
  end



end
