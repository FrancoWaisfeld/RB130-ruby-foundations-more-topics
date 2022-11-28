class Series
  attr_reader :numbers

  def initialize(string_digits)
    @numbers = string_digits
  end

  def slices(amount)
    raise ArgumentError if amount > numbers.size

    result = []

    (0..numbers.size - 1).each do |index|
      substring = numbers[index, amount]
      break if substring.length < amount
      result << substring.chars.map(&:to_i)
    end
    result
  end
end

p Series.new('01234').slices(2)
