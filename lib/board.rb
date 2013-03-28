class Board < Array

  def initialize(array = [1,2,3,4,5,6,7,8,9] )
    self << array
    flatten!
  end

  def get_all_diagonals_rows_and_columns
    [ get_diagonals, get_rows, get_columns].flatten(1)
  end

  def get_diagonals
    [ values_at(0,4,8), values_at(2,4,6) ]
  end

  def get_rows
    [ values_at(0,1,2), values_at(3,4,5), values_at(6,7,8) ]
  end

  def get_columns
    [ values_at(0,3,6), values_at(1,4,7), values_at(2,5,8) ]
  end

  def get_sides
    values_at(1,3,5,7)
  end

  def get_corners
    values_at(0,2,6,8)
  end

end
