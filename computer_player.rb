class ComputerPlayer

  attr_accessor :which_player, :other_player

  def initialize(which_player)
    @which_player = which_player
    if @which_player == 'X'
      @other_player = 'O'
    else
      @other_player = 'X'
    end

  end

  def mark_the_board(game)
    selected_space = false

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
    if game.board.include?(5)
      return 5
    else
      return false
    end
  end

  def choose_corner_if_available(game)
    corners = [ 1, 3, 7, 9 ]
    board_clone = game.board.clone
    available_corners = board_clone.include_any?(corners)

    if available_corners
      return available_corners.last
    else
      return false
    end

  end

  def choose_random_available_space(game)
    board_clone = game.board.clone
    board_clone.delete_if {|x| x.is_a? String}
    return board_clone.sample
  end

  def complete_for_win_or_block(game)
    lines = game.get_lines
    selected_space = false

    lines.each do |line|
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
    lines = game.get_lines
    selected_space = false
    lines.each do |line|
      if line.uniq.size == 3 && line.include?(@which_player) && !line.include?(@other_player)
        line_clone = line.clone.delete_if {|x| x.is_a? String}
        selected_space = line_clone.last unless selected_space
      end
    end
    return selected_space
  end

  def play_double_loss_strategy(game)
    selected_space = false
    turns = how_many_turns(game)
    if turns[:cpu] == 0 || turns[:cpu] == 2
      selected_space = choose_corner_if_available(game)
    elsif turns[:cpu] == 1
      selected_space = 1 if game.board.include? 1
      selected_space ||= choose_corner_if_available(game)
    end
    return selected_space
  end

  def block_double_loss_strategy(game)
    selected_space = false
    turns = how_many_turns(game)
    corners = game.board.values_at(0,8,2,6)
    sides = game.board.values_at(1,3,5,7)

    if turns[:cpu] == 0 && corners.include?('X')
      if corners.index('X').odd?
        selected_space = corners[corners.index('X') - 1]
      else
        selected_space = corners[corners.index('X') + 1]
      end
    elsif turns[:cpu] == 1 && corners.include?('X') && game.board[4] == 'X'
      selected_space = choose_corner_if_available(game)
    elsif turns[:cpu] == 0 && sides.include?('X')
      selected_space = 5
    elsif turns[:cpu] == 1 && 2 == sides.count {|x| x == 'X'}
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
        selected_space = selected_space = choose_corner_if_available(game)
      end
    end

    return selected_space
  end

  def how_many_turns(game)
    board = game.board.clone
    turns = Hash.new
    turns[:human] = board.count {|x| x == @other_player}
    turns[:cpu] = board.count {|x| x == @which_player}
    return turns
  end

end
