class HumanPlayer

  attr_accessor :which_player

  def initialize(which_player)
    @which_player = which_player
  end

  def mark_the_board(game, *test)

    input = false
    input = test.first unless test.empty?
    until input
      input = get_human_input
      break if valid_human_input?(input)
    end

    game.board[input.to_i - 1] = which_player unless game.board[input.to_i - 1].is_a? String

  end

  def get_human_input(*number_string)

    input = number_string.first unless number_string.empty?

    input ||= gets.chomp

    return input

  end

  def valid_human_input?(input)
    if input.respond_to?(:to_i)
      if input.to_i > 0 && input.to_i < 10
        return true
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
