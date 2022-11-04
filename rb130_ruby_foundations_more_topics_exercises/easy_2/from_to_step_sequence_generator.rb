=begin

start a loop that iterates until start is equal to or greater than stop
  yield(start)

=end

def step(start, stop, step)
  current_value = start

  while current_value <= stop
    yield(current_value)
    current_value += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
