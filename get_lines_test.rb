require 'test/unit'
require './get_lines.rb'
require './victory_checks.rb'
require './game.rb'

class GameTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_all_get_lines_methods_accept_no_arguments
    assert_nothing_raised(ArgumentError) {@game.get_lines}
    assert_nothing_raised(ArgumentError) {@game.get_diagonals}
    assert_nothing_raised(ArgumentError) {@game.get_rows}
    assert_nothing_raised(ArgumentError) {@game.get_columns}
  end

  def test_get_diagonals_returns_2_things
    diagonal_1, diagonal_2 = @game.get_diagonals
    assert_not_nil diagonal_1
    assert_not_nil diagonal_2
  end

  def test_get_rows_returns_3_things
    row_1, row_2, row_3 = @game.get_rows
    assert_not_nil row_1
    assert_not_nil row_2
    assert_not_nil row_3
  end

  def test_get_columns_returns_3_things
    column_1, column_2, column_3 = @game.get_columns
    assert_not_nil column_1
    assert_not_nil column_2
    assert_not_nil column_3
  end

  def test_get_diagonals_returns_proper_values
    diagonal_1, diagonal_2 = @game.get_diagonals
    assert_equal [1,5,9], diagonal_1
    assert_equal [3,5,7], diagonal_2
  end

  def test_get_rows_returns_proper_values
    row_1, row_2, row_3 = @game.get_rows
    assert_equal [1,2,3], row_1
    assert_equal [4,5,6], row_2
    assert_equal [7,8,9], row_3
  end

  def test_get_columns_returns_proper_values
    column_1, column_2, column_3 = @game.get_columns
    assert_equal [1,4,7], column_1
    assert_equal [2,5,8], column_2
    assert_equal [3,6,9], column_3
  end

  def test_get_lines_returns_array
    assert_kind_of Array, @game.get_lines
  end

  def test_get_lines_returns_array_containing_each_line
    all_lines = [ [1,5,9], [3,5,7], [1,2,3],[4,5,6],[7,8,9], [1,4,7],[2,5,8],[3,6,9]]

    assert_equal all_lines, @game.get_lines
  end

end
