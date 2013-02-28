require 'test/unit'
require './array_methods.rb'

class ArrayTest < Test::Unit::TestCase

  def setup
    @array = [ 1, 2, 3, 4, 5, 'X', 'O', 'X']
    @second_array = [1, 2, 'X', 'something']
  end

  def test_include_any_method_returns_false_if_it_contains_none
    assert_equal false, @array.include_any?(['something else'])
  end

  def test_include_any_method_returns_array_of_matching_elements
    assert_equal [1, 2, 'X'], @array.include_any?(@second_array)
  end

end
