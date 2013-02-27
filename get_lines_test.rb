require 'test/unit'
require './get_lines.rb'
require './game.rb'

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_all_get_lines_methods_accept_one_argument
    assert_raise(ArgumentError) {@game.get_lines}
    assert_raise(ArgumentError) {@game.get_diagonals}
    assert_raise(ArgumentError) {@game.get_rows}
    assert_raise(ArgumentError) {@game.get_columns}
  end

  def test_get_diagonals_returns_2_things
    diagonal_1, diagonal_2 = @game.get_diagonals(@game.board)
    assert_not_nil diagonal_1
    assert_not_nil diagonal_2
  end

  def test_get_rows_returns_3_things
    row_1, row_2, row_3 = @game.get_rows(@game.board)
    assert_not_nil row_1
    assert_not_nil row_2
    assert_not_nil row_3
  end

  def test_get_columns_returns_3_things
    column_1, column_2, column_3 = @game.get_columns(@game.board)
    assert_not_nil column_1
    assert_not_nil column_2
    assert_not_nil column_3
  end

  def test_get_diagonals_returns_proper_values
    diagonal_1, diagonal_2 = @game.get_diagonals(@game.board)
    assert_equal [1,5,9], diagonal_1
    assert_equal [3,5,7], diagonal_2
  end

  def test_get_rows_returns_proper_values
    row_1, row_2, row_3 = @game.get_rows(@game.board)
    assert_equal [1,2,3], row_1
    assert_equal [4,5,6], row_2
    assert_equal [7,8,9], row_3
  end

  def test_get_columns_returns_proper_values
    column_1, column_2, column_3 = @game.get_columns(@game.board)
    assert_equal [1,4,7], column_1
    assert_equal [2,5,8], column_2
    assert_equal [3,6,9], column_3
  end



end
