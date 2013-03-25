module VictoryChecks

  def draw?
    @who_won ||= @board.uniq.size == 2
  end

  def anybody_win?
    lines = get_all_three_in_a_rows
    lines.each do |line|
      @who_won = line.first if line.uniq.size == 1
    end
    @who_won
  end


end
