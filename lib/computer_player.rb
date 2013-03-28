class ComputerPlayer

  attr_accessor :which_player, :other_player

  def initialize(which_player)
    @first_player = :X
    @which_player = which_player
    @which_player == :X ? @other_player = :O : @other_player = :X
  end

  def mark_the_board(board)
    turns = how_many_turns(board)
    selected_space = complete_for_win_or_block(board)
    selected_space ||= play_double_loss_strategy(board) if @which_player == @first_player && turns < 3
    selected_space ||= block_double_loss_strategy(board) if @which_player != @first_player && turns == 1
    selected_space ||= choose_line_towards_victory(board)
    selected_space ||= choose_center_if_available(board)
    selected_space ||= choose_corner_if_available(board)
    selected_space ||= choose_random_available_space(board)
    board[board.index(selected_space)] = @which_player
  end

  def choose_center_if_available(board)
    board.include?(5) ? 5 : false
  end

  def choose_corner_if_available(board)
    corners = unmarked_spaces(board.get_corners)
    corners.empty? ? false : corners.last
  end

  def choose_random_available_space(board)
    unmarked_spaces(board).sample
  end

  def complete_for_win_or_block(board)
    selection = false
    board.get_all_diagonals_rows_and_columns.each do |line|
      if line.uniq.size == 2 && !unmarked_spaces(line).empty?
        line.include?(@which_player) ? selection = unmarked_spaces(line).first : selection ||= unmarked_spaces(line).first
      end
    end
    selection
  end

  def choose_line_towards_victory(board)
    selected_space = false
    board.get_all_diagonals_rows_and_columns.each do |line|
      if line.uniq.size == 3 && line.include?(@which_player) && !line.include?(@other_player)
        selected_space = unmarked_spaces(line).last
      end
    end
    selected_space
  end

  def play_double_loss_strategy(board)
    selected_space = false
    turns = how_many_turns(board)
    selected_space = choose_corner_if_available(board) if turns.even?
    turns.odd? && board.include?(1) ? selected_space = 1 : selected_space = choose_corner_if_available(board)
    selected_space
  end

  def block_double_loss_strategy(board)
    selected_space = false
    how_many_corners_they_chose = board.get_corners.count {|x| x == @first_player}
    selected_space = unmarked_spaces(board.get_sides).sample if 2 == how_many_corners_they_chose
    if 1 == how_many_corners_they_chose && board.get_sides.include?(@first_player)
      selected_space ||= block_corner_then_side_strategy(board)
    end
    selected_space ||= block_2_adjacent_side_strategy(board)
    selected_space
  end

  def block_corner_then_side_strategy(board)
    opponents_spaces = [1,2,3,4,6,7,8,9].delete_if{|x| unmarked_spaces(board).include?(x)}
    6 == opponents_spaces.map{|x|x-1}.reduce(:*) ? 1 : 3
  end

  def block_2_adjacent_side_strategy(board)
    selected_space = [2,4,6,8].delete_if{|x| unmarked_spaces(board.get_sides).include?(x)}.reduce(:+) - 5
    selected_space = false if selected_space == 5
  end

  def how_many_turns(board)
    board.count{|x| x == @which_player}
  end

  def unmarked_spaces(array)
    array.select { |x| x.is_a? Integer }
  end

end
