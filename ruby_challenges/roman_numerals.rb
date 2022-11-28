class RomanNumeral
  ROMAN_NUMERALS = [
    ['M', 1000],
    ['CM', 900],
    ['D', 500],
    ['CD', 400],
    ['C', 100],
    ['XC', 90],
    ['L', 50],
    ['XL', 40],
    ['X', 10],
    ['IX', 9],
    ['V', 5],
    ['IV', 4],
    ['I', 1]
  ].freeze

  def initialize(number)
    @number = number
  end

  def to_roman
    left_over = @number
    roman_numeral = ''

    ROMAN_NUMERALS.each do |v1, v2|
      next unless v2 <= left_over

      result = left_over / v2
      roman_numeral <<  v1 * result
      left_over -= v2 * result
    end
    roman_numeral
  end
end
