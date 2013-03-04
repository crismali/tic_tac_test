require 'test/unit'
require './array_methods.rb'
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

  def test_choose_line_towards_victory_selects_properly
    @game.board = [ 1, 2, 3, 'O', 'O', 'X', 7, 8, 9 ]
    assert_equal 9, @cpu.choose_line_towards_victory(@game)
  end

  def test_choose_line_towards_victory_returns_false_if_criteria_is_not_met
    assert_equal false, @cpu.choose_line_towards_victory(@game)
  end

  def test_choose_corner_if_available_returns_corner
    @game.board = [ 1, 2, 3, 'O', 'O', 'X', 7, 8, 9 ]
    assert_equal 9, @cpu.choose_corner_if_available(@game)
  end

  def test_ccia_returns_corner_other_than_nine
    @game.board = [ 1, 2, 3, 'O', 'O', 'X', 7, 8, 'O' ]
    assert_equal 7, @cpu.choose_corner_if_available(@game)
  end

  def test_ccia_returns_false_if_no_corners_available
    @game.board = [ 'O', 2, 'O', 'O', 'O', 'X', 'X', 8, 'X' ]
    assert_equal false, @cpu.choose_corner_if_available(@game)
  end

  def test_choose_center_if_available_returns_center_if_available
    assert_equal 5, @cpu.choose_center_if_available(@game)
  end

  def test_choose_center_returns_false_when_center_not_available
    @game.board[4] = 'X'
    assert_equal false, @cpu.choose_center_if_available(@game)
  end

  def test_mark_the_board_changes_board_in_game_object
    @game2 = Game.new
    @cpu.mark_the_board(@game)
    assert_not_equal @game2.board, @game.board
    assert_equal false, (@game2.board == @game.board)
  end

  def test_responds_to_going_first_strategies
    assert_respond_to @cpu, :going_first_strategies
  end

  def test_responds_to_going_second_strategies
    assert_respond_to @cpu, :going_second_strategies
  end

  def test_responds_to_block_three_corner_strategy
    assert_respond_to @cpu, :block_three_corner_strategy
  end

  def responds_to_how_many_turns_method
    assert_respond_to @cpu, :how_many_turns
  end

  def test_how_many_turns_returns_proper_values
    @game.board = [  1, 2, 3, 'X', 'X', 'O', 7, 8, 9 ]

    turns = @cpu.how_many_turns(@game)

    assert_equal 2, turns[:cpu]
    assert_equal 1, turns[:human]
  end

  def test_how_many_turns_returns_proper_values_when_cpu_goes_second
    @cpu = ComputerPlayer.new('O')
    @game.board = [  1, 2, 3, 'X', 'X', 'O', 7, 8, 9 ]

    turns = @cpu.how_many_turns(@game)

    assert_equal 2, turns[:human]
    assert_equal 1, turns[:cpu]
  end

  def test_block_three_corner_strategy_blocks_correctly
    @cpu.which_player = 'O'
    @game.board[2] = 'X'
    cpu_choice = @cpu.block_three_corner_strategy(@game)
    @game.board[@game.board.index(cpu_choice)] = @cpu.which_player
    assert_equal 'O', @game.board[6]
  end

  def test_btcs_blocks_right_when_cpu_is_second_on_second_move

  end






end
