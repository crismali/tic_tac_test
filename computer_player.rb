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
    selected_space = complete_for_win_or_block(game)

    game.board[game.board.index(selected_space)] = selected_space if selected_space.is_a? Integer

    return game.board
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


end
