def measure_time
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Duration: #{end_time - start_time} seconds"
end

def divisors(number)
  results = []

  limit = Integer.sqrt(number)
  1.upto(limit) do |num|
    if number % num == 0
      results << num 
      results << number / num
    end
  end
  results.uniq.sort
end

measure_time { p divisors(999962000357) == [1, 999979, 999983, 999962000357] }
