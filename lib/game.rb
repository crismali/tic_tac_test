class Game

  include GetAllThreeInARows
  include VictoryChecks
  include Setup

  attr_accessor :board, :who_won

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @who_won = false
  end

  def draw_board
   system ('clear')

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


end
