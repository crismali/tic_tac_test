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

  def test_get_diagonals_returns_2_objects

    diagonal_1, diagonal_2 = @game.get_diagonals(@game.board)

    assert_not_nil diagonal_1
    assert_not_nil diagonal_2

  end




end
