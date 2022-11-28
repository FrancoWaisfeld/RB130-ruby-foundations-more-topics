class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    aliquot_sum =  sum_factors(number)
    if aliquot_sum > number
      'abundant'
    elsif aliquot_sum < number
      'deficient'
    else
      'perfect'
    end
  end

  class << self
    private

    def sum_factors(number)
      (1...number).select { |divisor| number % divisor == 0 }.sum
    end
  end
end
