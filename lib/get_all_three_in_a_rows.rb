module GetAllThreeInARows

  def get_all_three_in_a_rows
    three_in_a_rows = []
    three_in_a_rows << get_diagonals
    three_in_a_rows << get_rows
    three_in_a_rows << get_columns
    three_in_a_rows.flatten(1)
  end

  def get_diagonals

    diagonal_1 = @board.values_at(0,4,8)
    diagonal_2 = @board.values_at(2,4,6)

    return diagonal_1, diagonal_2

  end

  def get_rows

    row_1 = @board.values_at(0,1,2)
    row_2 = @board.values_at(3,4,5)
    row_3 = @board.values_at(6,7,8)

    return row_1, row_2, row_3

  end

  def get_columns

    column_1 = @board.values_at(0,3,6)
    column_2 = @board.values_at(1,4,7)
    column_3 = @board.values_at(2,5,8)

    return column_1, column_2, column_3

  end

end
