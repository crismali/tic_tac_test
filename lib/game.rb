class Game

  include Setup

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
    board.get_all_three_in_a_rows.each {|x| return true if x.uniq.size == 1}
    false
  end

end
