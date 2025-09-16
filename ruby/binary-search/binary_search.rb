class BinarySearch
  def initialize(array)
    @array = array
  end

  def search_for(element)
    return if array.empty?

    middle = low_index = 0
    high_index = array.length
    while low_index <= high_index
      middle = (low_index + high_index) / 2
      return nil if middle >= array.length

      if array[middle] == element
        return middle
      elsif element > array[middle]
        low_index = middle + 1
      else
        high_index = middle - 1
      end
    end
  end

  private

  attr_reader :array
end
