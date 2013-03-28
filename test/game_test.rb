require 'test/unit'
require '../lib/board.rb'
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

  def test_anybody_win_returns_false_if_no_one_has_won
    assert_equal false, @game.anybody_win?
  end

  def test_anybody_win_returns_true_if_someone_has_won
    @game.board = Board.new( ['X','X','X',4,5,6,7,8,9] )
    assert_equal true, @game.anybody_win?
  end

  def test_game_has_play_method
    assert_respond_to @game, :play
  end

end
