def zip(collection1, collection2)
  counter = 0
  result = []

  while counter < collection1.size
    result << [collection1[counter], collection2[counter]]
    counter += 1
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
