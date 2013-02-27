module GetLines

  def get_lines(board)

    lines = Array.new

    lines << get_diagonals(board)
    lines << get_rows(board)
    lines << get_columns(board)

    return lines.flatten(1)

  end

  def get_diagonals(board)

    diagonal_1 = board.values_at(0,4,8)
    diagonal_2 = board.values_at(2,4,6)

    return diagonal_1, diagonal_2

  end

  def get_rows(board)

    row_1 = board.values_at(0,1,2)
    row_2 = board.values_at(3,4,5)
    row_3 = board.values_at(6,7,8)

    return row_1, row_2, row_3

  end

  def get_columns(board)

    column_1 = board.values_at(0,3,6)
    column_2 = board.values_at(1,4,7)
    column_3 = board.values_at(2,5,8)

    return column_1, column_2, column_3

  end

end
