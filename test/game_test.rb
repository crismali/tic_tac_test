require 'test/unit'
require '../lib/array_methods.rb'
require '../lib/get_all_three_in_a_rows.rb'
require '../lib/victory_checks.rb'
require '../lib/setup.rb'
require '../lib/game.rb'

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_game_has_board_method
    assert_respond_to @game, :board, 'No board method'
  end

  def test_game_initializes_board
    assert_equal [1,2,3,4,5,6,7,8,9], @game.board
  end

  def test_can_change_value_of_board_elements
    @game.board[3] = 'X'

    assert_equal 'X', @game.board[3]

  end


end
