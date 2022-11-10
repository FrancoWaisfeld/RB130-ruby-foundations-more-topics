factorial = Enumerator.new do |yielder|
  number = 0
  total = 1
  loop do
    total = number == 0 ? 1 : total * number
    yielder.yield(total)
    number += 1
  end
end

number = 0
loop do
  puts "#{number}! : #{factorial.next}"
  number +=1
  break if number > 7
end

puts

number = 0
loop do
  puts "#{number}! : #{factorial.next}"
  number +=1
  break if number > 3
end

puts
factorial.rewind

number = 0
loop do
  puts "#{number}! : #{factorial.next}"
  number +=1
  break if number > 7
end

puts

factorial.each_with_index do |total, number|
  puts "#{number}! : #{total}"
  break if number > 6
end
