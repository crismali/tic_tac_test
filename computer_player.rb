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
      if line.uniq.size == 3 && line.include?(@which_player)
        line_clone = line.clone.delete_if {|x| x.is_a? String}
        selected_space = line_clone.last
      end
    end
    return selected_space
  end

  def something(game)
    game.get_lines.each {|line| line = 'c'}

  end





end
