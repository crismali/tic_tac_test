require 'test/unit'
require './get_lines.rb'
require './victory_checks.rb'
require './game.rb'

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_draw_method_returns_false_if_its_not_a_draw
    assert_equal false, @game.draw?
  end

  def test_draw_method_returns_true_if_it_is_a_draw
    @game.board = [ 'O','X','O','O','O','X','X','O','X']
    assert_equal true, @game.draw?
  end

  def test_anybody_win_returns_false_if_no_one_has_won
    assert_equal false, @game.anybody_win?
  end

  def test_anybody_win_returns_who_won_if_someone_has_won
    @game.board = ['X','X','X',4,5,6,7,8,9]
    assert_equal 'X', @game.anybody_win?
  end

end
