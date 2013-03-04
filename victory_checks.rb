module VictoryChecks

  def draw?
    @who_won = @board.uniq.size == 2
  end

  def anybody_win?
    lines = get_lines
    someone_won = false
    lines.each do |line|
      someone_won = line.first if line.uniq.size == 1
    end
    @who_won = someone_won
  end


end
