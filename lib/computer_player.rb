class ComputerPlayer

  attr_accessor :which_player, :other_player

  def initialize(which_player)
    @first_player = 'X'
    @which_player = which_player
    @which_player == 'X' ? @other_player = 'O' : @other_player = 'X'
  end

  def mark_the_board(game)
    selected_space = complete_for_win_or_block(game)
    selected_space ||= play_double_loss_strategy(game) if @which_player == 'X'
    selected_space ||= block_double_loss_strategy(game) if @which_player == 'O' && how_many_turns(game) == 1
    selected_space ||= choose_line_towards_victory(game)
    selected_space ||= choose_center_if_available(game)
    selected_space ||= choose_corner_if_available(game)
    selected_space ||= choose_random_available_space(game)
    game.board[game.board.index(selected_space)] = @which_player
  end

  def choose_center_if_available(game)
    game.board.include?(5) ? 5 : false
  end

  def choose_corner_if_available(game)
    corners = unmarked_spaces(game.get_corners)
    corners.empty? ? false : corners.last
  end

  def choose_random_available_space(game)
    unmarked_spaces(game.board).sample
  end

  def complete_for_win_or_block(game)
    selection = false
    game.get_all_three_in_a_rows.each do |line|
      if line.uniq.size == 2 && !unmarked_spaces(line).empty?
        line.include?(@which_player) ? selection = unmarked_spaces(line).first : selection ||= unmarked_spaces(line).first
      end
    end
    selection
  end

  def choose_line_towards_victory(game)
    selected_space = false
    game.get_all_three_in_a_rows.each do |line|
      if line.uniq.size == 3 && line.include?(@which_player) && !line.include?(@other_player)
        selected_space = unmarked_spaces(line).last
      end
    end
    selected_space
  end

  def play_double_loss_strategy(game)
    selected_space = false
    turns = how_many_turns(game)
    if turns < 3
      selected_space = choose_corner_if_available(game) if turns.even?
      turns.odd? && game.board.include?(1) ? selected_space = 1 : selected_space = choose_corner_if_available(game)
    end
    selected_space
  end

  def block_double_loss_strategy(game)
    selected_space = false
    how_many_corners_they_chose = game.get_corners.count {|x| x == @first_player}
    selected_space = unmarked_spaces(game.get_sides).sample if 2 == how_many_corners_they_chose
    selected_space ||= block_strategy_involving_corner_space(game) if 1 == how_many_corners_they_chose
    selected_space ||= block_2_adjacent_side_strategy(game)
    selected_space
  end

  def block_strategy_involving_corner_space(game)
    if game.board[4] == @first_player
      choose_corner_if_available(game)
    elsif game.get_sides.include? @first_player
      block_corner_then_side_strategy(game)
    end
  end

  def block_corner_then_side_strategy(game)
    opponents_spaces = [1,2,3,4,6,7,8,9].delete_if{|x| unmarked_spaces(game.board).include?(x)}
    product_of_opponent_spaces = opponents_spaces.map{|x|x-1}.reduce(:*)
    6 == product_of_opponent_spaces ? 1 : 3
  end

  def block_2_adjacent_side_strategy(game)
    selected_space = [2,4,6,8].delete_if{|x| unmarked_spaces(game.get_sides).include?(x)}.reduce(:+) - 5
    selected_space = false if selected_space == 5
  end

  def how_many_turns(game)
    game.board.count{|x| x == @which_player}
  end

  def unmarked_spaces(array)
    array.reject { |x| x.is_a? String }
  end

end
