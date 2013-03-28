require 'test/unit'
require '../lib/board.rb'

class BoardTest < Test::Unit::TestCase

  def setup
    @board = Board.new
  end

  def test_all_get_all_three_in_a_rows_methods_accept_no_arguments
    assert_nothing_raised(ArgumentError) {@board.get_all_three_in_a_rows}
    assert_nothing_raised(ArgumentError) {@board.get_diagonals}
    assert_nothing_raised(ArgumentError) {@board.get_rows}
    assert_nothing_raised(ArgumentError) {@board.get_columns}
  end

  def test_get_diagonals_returns_2_things
    diagonal_1, diagonal_2 = @board.get_diagonals
    assert_not_nil diagonal_1
    assert_not_nil diagonal_2
  end

  def test_get_rows_returns_3_things
    row_1, row_2, row_3 = @board.get_rows
    assert_not_nil row_1
    assert_not_nil row_2
    assert_not_nil row_3
  end

  def test_get_columns_returns_3_things
    column_1, column_2, column_3 = @board.get_columns
    assert_not_nil column_1
    assert_not_nil column_2
    assert_not_nil column_3
  end

  def test_get_diagonals_returns_proper_values
    diagonal_1, diagonal_2 = @board.get_diagonals
    assert_equal [1,5,9], diagonal_1
    assert_equal [3,5,7], diagonal_2
  end

  def test_get_rows_returns_proper_values
    row_1, row_2, row_3 = @board.get_rows
    assert_equal [1,2,3], row_1
    assert_equal [4,5,6], row_2
    assert_equal [7,8,9], row_3
  end

  def test_get_columns_returns_proper_values
    column_1, column_2, column_3 = @board.get_columns
    assert_equal [1,4,7], column_1
    assert_equal [2,5,8], column_2
    assert_equal [3,6,9], column_3
  end

  def test_get_all_three_in_a_rows_returns_array
    assert_kind_of Array, @board.get_all_three_in_a_rows
  end

  def test_get_all_three_in_a_rows_returns_array_containing_each_line
    all_lines = [ [1,5,9], [3,5,7], [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9] ]
    assert_equal all_lines, @board.get_all_three_in_a_rows
  end

  def test_get_sides_returns_non_corner_non_center_board_spaces
    assert_equal [2,4,6,8], @board.get_sides
  end

  def test_get_corners_returns_corner_spaces
    assert_equal [1,3,7,9], @board.get_corners
  end

end
