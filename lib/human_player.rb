class HumanPlayer

  attr_accessor :which_player

  def initialize(which_player)
    @which_player = which_player
  end

  def mark_the_board(board, *test)
    puts "Please enter a number that corresponds to an unmarked space."
    puts "(psst, in case you forgot, you're #{@which_player}'s)"
    input = false
    input = test.first.to_i unless test.empty?
    while true
      input = get_human_input.to_i unless test.first.to_i > 0 && test.first.to_i < 10
      break if valid_human_input?(input, board)
    end
    change_the_board(board, input - 1)
  end

  def get_human_input(*number_string)
    input = number_string.first unless number_string.empty?
    input ||= gets.chomp
  end

  def valid_human_input?(input, board)
    if board.reject {|x| space_marked? x }.include?(input)
      return true
    else
      puts "Invalid choice: only numbers that are greater than 0 or less than 10 "
      puts "that correspond to an unmarked space are accepted"
      return false
    end
  end

  def change_the_board(board, input)
    board[input] = @which_player unless space_marked? board[input]
  end

  def space_marked?(space)
    space.is_a? Symbol
  end

end
