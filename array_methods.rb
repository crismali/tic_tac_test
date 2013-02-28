class Array

def include_any?(array)
    new_array = Array.new
    array.each do |array_part|
      new_array << array_part if self.include? array_part
    end

    if new_array.empty?
      return false
    else
      return new_array
    end
  end

end
