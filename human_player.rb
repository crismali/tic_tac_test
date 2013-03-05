class HumanPlayer

  attr_accessor :which_player

  def initialize(which_player)
    @which_player = which_player
  end

  def mark_the_board(game, *test)

    puts "Please enter a number that corresponds to an unmarked space."
    puts "(psst, in case you forgot, you're #{@which_player}'s)"

    input = false
    input = test.first unless test.empty?
    until input
      input = get_human_input
      break if valid_human_input?(input, game)
    end

    game.board[input.to_i - 1] = which_player unless game.board[input.to_i - 1].is_a? String

  end

  def get_human_input(*number_string)

    input = number_string.first unless number_string.empty?

    input ||= gets.chomp

    return input

  end

  def valid_human_input?(input, game)
    board_clone = game.board.clone.delete_if {|x| x.is_a? String }
    if input.respond_to?(:to_i)
      input = input.to_i
      if input > 0 && input < 10
        if board_clone.include?(input)
          return true
        else
          puts 'Invalid choice: please select a space that is not occupied.'
          return false
        end
      else
        puts "Invalid choice: only numbers that are greater than 0 or less than 10 are accepted"
        return false
      end
    else
      puts "Invalid choice: only numbers that are greater than 0 or less than 10 are accepted"
      return false
    end
  end

end
