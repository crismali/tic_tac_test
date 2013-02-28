require 'test/unit'
require './get_lines.rb'
require './victory_checks.rb'
require './game.rb'
require './computer_player.rb'

class ComputerPlayerTest < Test::Unit::TestCase

  def setup
    @cpu = ComputerPlayer.new('X')
    @game = Game.new
  end

  def test_cpu_player_is_real_class
    assert_kind_of ComputerPlayer, @cpu
  end

  def test_cpu_has_which_player_method_and_attribute
    assert_respond_to @cpu, :which_player, 'No which_player method'
    assert_equal 'X', @cpu.which_player
  end

  def test_cpu_has_mark_the_board_method
    assert_respond_to @cpu, :mark_the_board
  end

  def test_mark_the_board_accepts_an_argument
    assert_nothing_raised(ArgumentError) {@cpu.mark_the_board(@game)}
  end

  def test_mark_the_board_returns_an_array
    assert_kind_of Array, @cpu.mark_the_board(@game)
  end

  def test_cpu_has_complete_for_win_or_block_method
    assert_respond_to @cpu, :complete_for_win_or_block
  end

  def test_cpus_complete_for_win_or_block_method_accepts_an_argument
    assert_nothing_raised(ArgumentError) {@cpu.complete_for_win_or_block(@game)}
  end

  def test_complete_for_win_or_block_returns_false_if_it_cant_block_or_complete_for_win
    assert_equal false, @cpu.complete_for_win_or_block(@game)
  end

  def test_cfw_or_block_returns_number_of_space_to_block
    @game.board[0] = 'O'
    @game.board[1] = 'O'
    assert_equal 3, @cpu.complete_for_win_or_block(@game)
  end

  def test_cfw_or_block_returns_number_of_space_to_complete_for_win
    @game.board[0] = 'X'
    @game.board[1] = 'X'
    assert_equal 3, @cpu.complete_for_win_or_block(@game)
  end

  def test_cfw_or_block_completes_for_win_rather_than_blocking_when_both_possible
    @game.board[0] = 'O'
    @game.board[1] = 'O'
    @game.board[6] = 'X'
    @game.board[7] = 'X'
    assert_equal 9, @cpu.complete_for_win_or_block(@game)
  end

  def test_cfw_or_block_returns_false_when_line_is_fully_marked
    @game.board = [ 'X', 'O', 'O', 4, 5, 6, 7, 8, 9 ]
    assert_equal false, @cpu.complete_for_win_or_block(@game)
  end

  def test_choose_random_available_space
    @game.board = [ 'X', 'O', 'O', 'X', 'O', 'O', 'X', 'O', 9 ]
    assert_equal 9, @cpu.choose_random_available_space(@game)
  end

  def test_cras_method_wont_return_letter
    @game.board = [ 'X', 'O', 'O', 4, 5, 6, 7, 8, 9 ]
    assert_kind_of Integer, @cpu.choose_random_available_space(@game)
  end



end
