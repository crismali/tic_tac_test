class Game

  include Setup

  attr_accessor :board, :who_won

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
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

  def get_all_three_in_a_rows
    [ get_diagonals, get_rows, get_columns].flatten(1)
  end

  def get_diagonals
    [ @board.values_at(0,4,8), @board.values_at(2,4,6) ]
  end

  def get_rows
    [ @board.values_at(0,1,2), @board.values_at(3,4,5), @board.values_at(6,7,8) ]
  end

  def get_columns
    [ @board.values_at(0,3,6), @board.values_at(1,4,7), @board.values_at(2,5,8) ]
  end

  def get_sides
    @board.values_at(1,3,5,7)
  end

  def get_corners
    @board.values_at(0,2,6,8)
  end

  def draw?
    @who_won ||= @board.uniq.size == 2
  end

  def anybody_win?
    get_all_three_in_a_rows.each {|x| @who_won = x.first if x.uniq.size == 1}
    @who_won
  end

end
