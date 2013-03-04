class Game

  include GetLines
  include VictoryChecks

  attr_accessor :board, :who_won

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @who_won = false
  end


end
