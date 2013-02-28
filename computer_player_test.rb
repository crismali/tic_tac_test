require 'test/unit'
require './get_lines.rb'
require './computer_player.rb'

class ComputerPlayerTest < Test::Unit::TestCase

  def setup
    @cpu = ComputerPlayer.new('X')
  end

  def test_cpu_player_is_real_class
    assert_kind_of ComputerPlayer, @cpu
  end

  def test_cpu_has_which_player_method_and_attribute
    assert_respond_to @cpu, :which_player, 'No which_player method'
    assert_equal 'X', @cpu.which_player
  end




end
