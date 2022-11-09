def max_by(array)
  max_element = array.first
  max_block_return = yield(max_element) unless array.empty?

  array.each_with_index do |element, index|
    current_block_return = yield(element)
    if current_block_return > max_block_return
      max_element = element
      max_block_return = current_block_return
    end
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
