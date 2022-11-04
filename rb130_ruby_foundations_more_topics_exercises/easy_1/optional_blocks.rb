def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute."
  end
end

p compute(2) { |n| n * (5 + 3) } == 16
p compute('c') { |letter| 'a' + 'b' + letter } == 'abc'
p compute(nil) == 'Does not compute.'
