class HumanPlayer

  def mark_the_board(board)

    return board

  end

  def get_human_input(*number_string)

    input = number_string.first unless number_string.empty?

    input ||= gets.chomp

    return input

  end

  def valid_human_input?(input)

    if input.to_i > 0 && input.to_i < 10
      return true
    else
      puts "Invalid choice: only numbers that are greater than 0 or less than 10 are accepted"
      return false
    end
  end

end
