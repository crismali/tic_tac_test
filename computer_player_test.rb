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
    assert_nothing_raised(ArgumentError) {@cpu.mark_the_board('something')}
  end

  def test_mark_the_board_returns_an_array
    assert_kind_of Array, @cpu.mark_the_board(@game.board)
  end



end
