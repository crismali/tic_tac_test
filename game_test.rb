require 'test/unit'
require './game.rb'

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_game_has_board_method
    assert_respond_to @game, :board, 'No board method'
  end


end
