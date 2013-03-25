module GetAllThreeInARows

  def get_all_three_in_a_rows
    three_in_a_rows = []
    three_in_a_rows << get_diagonals
    three_in_a_rows << get_rows
    three_in_a_rows << get_columns
    three_in_a_rows.flatten(1)
  end

  def get_diagonals
    [ @board.values_at(0,4,8), @board.values_at(2,4,6) ]
  end

  def get_rows
    [ @board.values_at(0,1,2), @board.values_at(3,4,5), @board.values_at(6,7,8) ]
  end

  def get_columns
    [ @board.values_at(0,3,6), @board.values_at(1,4,7), @board.values_at(2,5,8) ]
  end

end
