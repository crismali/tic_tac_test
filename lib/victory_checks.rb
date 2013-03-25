module VictoryChecks

  def draw?
    @who_won ||= @board.uniq.size == 2
  end

  def anybody_win?
    get_all_three_in_a_rows.each do |row_column_diagonal|
      @who_won = row_column_diagonal.first if row_column_diagonal.uniq.size == 1
    end
    @who_won
  end

end
