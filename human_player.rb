class HumanPlayer

  def mark_the_board(board)

    return board

  end

  def get_human_input(*number_string)

    input = number_string.first unless number_string.empty?

    input ||= gets.chomp

    return input

  end

end
