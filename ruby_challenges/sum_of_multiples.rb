class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(limit)
    result = []

    multiples.each do |multiple|
      (multiple...limit).step(multiple) { |number| result << number }
    end

    result.uniq.sum
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end
end
