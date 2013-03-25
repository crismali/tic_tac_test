class Array

  def include_any?(array)
    new_array = []
    array.each {|x| new_array << x if self.include? x }
    new_array.empty? ? false : new_array
  end

end
