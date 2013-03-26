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
    corners = unmarked_spaces(game.board.values_at(0,2,6,8))
    corners.empty? ? false : corners.last
  end

  def choose_random_available_space(game)
    unmarked_spaces(game.board).sample
  end

  def complete_for_win_or_block(game)
    selected_space = false
    game.get_all_three_in_a_rows.each do |line|
      available_spaces = unmarked_spaces(line)
      if line.uniq.size == 2 && !available_spaces.empty?
        line.include?(@which_player) ? selected_space = available_spaces.first : selected_space ||= available_spaces.first
      end
    end
    selected_space
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
    turns = how_many_turns(game)
    corners = game.board.values_at(0,2,6,8)
    sides = game.board.values_at(1,3,5,7)
    absolute_sides = [2,4,6,8]
    remaining_sides = unmarked_spaces(sides)
    available_spaces = unmarked_spaces(game.board)
    absolute_board = [1,2,3,4,6,7,8,9]

    selected_space = 5 if available_spaces.include?(5) && turns == 0
    selected_space = remaining_sides.sample if 2 == corners.count {|x| x == 'X'} && turns == 1

    if turns == 1
      if corners.include?('X')
        if game.board[4] == 'X'
          selected_space = choose_corner_if_available(game)
        elsif sides.include?('X')
          #blocks corner then side / vice versa strategy
          6 == absolute_board.delete_if{|x| available_spaces.include?(x)}.map{|x|x-1}.reduce(:*) ? selected_space = 1 : selected_space = 3
        end
      else
        #blocks 2 adjacent side strat
        selected_space = absolute_sides.delete_if{|x| unmarked_spaces(sides).include?(x)}.reduce(:+) - 5
      end
    end
    selected_space
  end

  def how_many_turns(game)
    turns = game.board.count{|x| x == @which_player}
  end

  def unmarked_spaces(array)
    array.reject { |x| x.is_a? String }
  end

end
