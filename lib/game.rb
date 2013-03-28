class Game

  include Setup

  attr_accessor :board, :who_won

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

  def draw?
    @who_won ||= @board.uniq.size == 2
  end

  def anybody_win?
    board.get_all_three_in_a_rows.each {|x| @who_won = x.first if x.uniq.size == 1}
    @who_won
  end

end
