require 'test/unit'
require '../lib/get_lines.rb'
require '../lib/victory_checks.rb'
require '../lib/setup.rb'
require '../lib/game.rb'
require '../lib/human_player.rb'

class HumanPlayerTest < Test::Unit::TestCase

  def setup
    @game = Game.new
    @player = HumanPlayer.new('X')
  end

  def test_human_player_is_a_class
    assert_kind_of Class, HumanPlayer
  end

  def test_has_a_mark_the_board_method
    assert_respond_to @player, :mark_the_board, 'No mark the board method'
  end

  def test_mark_the_board_accepts_an_argument
    assert_nothing_raised(ArgumentError) {@player.mark_the_board(@game, '1')}
  end

  def test_get_human_input_accepts_argument
    assert_nothing_raised(ArgumentError) {@player.get_human_input('1')}
  end

  def test_get_human_input_returns_argument
    assert_equal '1', @player.get_human_input('1')
  end

  def test_valid_human_input_returns_true_for_valid_input
    assert_equal true, @player.valid_human_input?('3', @game)
  end

  def test_valid_human_input_returns_false_for_invalid_input
    assert_equal false, @player.valid_human_input?('cat', @game)
  end

  def test_valid_human_input_wont_let_you_mark_an_occupied_space
    @game.board[0] = 'O'
    assert_equal false, @player.valid_human_input?('1', @game)
  end

  def test_mark_the_board_actually_marks_the_board
    @player.mark_the_board(@game, '1')
    assert_equal 'X', @game.board[0]
  end

  def test_human_player_has_which_player_attribute_and_method
    assert_equal 'X', @player.which_player
  end

end
