class Octal
  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 if invalid_octal?

    exponent = -1
    octal_string.to_i.digits.inject(0) do |sum, number|
      exponent += 1
      sum + (8**exponent) * number
    end
  end

  private

  def invalid_octal?
    octal_string.match?(/([a-z]|8|9)/i)
  end
end

p Octal.new("1234567").to_decimal
