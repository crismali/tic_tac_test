class ComputerPlayer

  attr_accessor :which_player, :other_player

  def initialize(which_player)
    @which_player = which_player
    @which_player == 'X' ? @other_player = 'O' : @other_player = 'X'
  end

  def mark_the_board(game)
    selected_space = complete_for_win_or_block(game)
    selected_space ||= play_double_loss_strategy(game) if @which_player == 'X'
    selected_space ||= block_double_loss_strategy(game) if @which_player == 'O'
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
    corners = game.board.values_at(0,2,6,8).delete_if{|x| x.is_a? String}
    corners.empty? ? false : corners.last
  end

  def choose_random_available_space(game)
    game.board.clone.delete_if {|x| x.is_a? String}.sample
  end

  def complete_for_win_or_block(game)
    selected_space = false
    game.get_all_three_in_a_rows.each do |line|
      if line.uniq.size == 2

        line_clone = line.clone.delete_if {|x| x.is_a? String}

        unless line_clone.empty?
          if line.include?(@which_player)
            selected_space = line_clone.first
          else
            selected_space ||= line_clone.first
          end
        end
      end
    end

    return selected_space
  end

  def choose_line_towards_victory(game)
    selected_space = false
    game.get_all_three_in_a_rows.each do |line|
      if line.uniq.size == 3 && line.include?(@which_player) && !line.include?(@other_player)
        selected_space = line.clone.delete_if {|x| x.is_a? String}.last
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
    turns = how_many_turns(game)
    corners = game.board.values_at(0,2,6,8)
    sides = game.board.values_at(1,3,5,7)
    remaining_sides = sides.clone.delete_if {|x| x.is_a? String}

    if turns == 0 && (corners.include?('X') || sides.include?('X'))
      selected_space = 5
    elsif turns == 1 && 2 == corners.count {|x| x == 'X'}
      selected_space = remaining_sides.sample
    elsif turns == 1 && corners.include?('X') && game.board[4] == 'X'
      selected_space = choose_corner_if_available(game)
    elsif turns == 1 && corners.include?('X') && sides.include?('X')
      if game.board[1] == 'X' && game.board[6] == 'X'
        selected_space = 1 unless game.board[0].is_a?(String)
      elsif game.board[1] == 'X' && game.board[8] == 'X'
        selected_space = 3 unless game.board[2].is_a?(String)
      elsif game.board[3] == 'X' && game.board[2] == 'X'
        selected_space = 1 unless game.board[0].is_a?(String)
      elsif game.board[5] == 'X' && game.board[0] == 'X'
        selected_space = 3 unless game.board[2].is_a?(String)
      end
    elsif turns == 1 && 2 == sides.count {|x| x == 'X'}
      xx = ['X','X']
      if sides.values_at(0,1) == xx
        selected_space = 1 unless game.board[0].is_a?(String)
      elsif sides.values_at(0,2) == xx
        selected_space = 3 unless game.board[2].is_a?(String)
      elsif sides.values_at(1,3) == xx
        selected_space = 7 unless game.board[6].is_a?(String)
      elsif sides.values_at(2,3) == xx
        selected_space = 9 unless game.board[8].is_a?(String)
      else
        selected_space = choose_corner_if_available(game)
      end
    end
    return selected_space
  end

  def how_many_turns(game)
    turns = game.board.count{|x| x == @which_player}
  end

  def unmarked_spaces(array)
    array.reject { |x| x.is_a? String }
  end

end
