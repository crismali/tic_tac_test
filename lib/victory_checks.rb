module VictoryChecks

  def draw?
    @who_won ||= @board.uniq.size == 2
  end

  def anybody_win?
    lines = get_lines
    lines.each do |line|
      @who_won = line.first if line.uniq.size == 1
    end
    @who_won
  end


end
