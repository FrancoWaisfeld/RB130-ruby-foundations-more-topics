=begin

input: integer
output: string representing roman numeral

explicit rules:
- convert decimal numbers to roman numerals

implcit rules:
- create a RomanNumeral class
  - add a constructor method that stores an integer
  - add a to_roman instance method that converts the stored integer to roman numerals

database: Hash

algorithm:
RomanNumeral class
- set a constant to a hash containing roman numerals as keys and their decimal
  equivalent as values. first key / hash is largest roman numeral
- constructor method
  - set instance variable @number to argument integer
- to_roman instance method
  - set local variable left_over to @number
  - set local variable roman_numeral to empty string
  - iterate through the keys and values in ROMAN_NUMERALS constant
    - if current value <= left_over
      - set result to left_over / current value
      - roman_numeral << result * current key
      - left_over -= result * current value
  - end loop
  - return roman_numeral
=end

class RomanNumeral
  ROMAN_NUMERALS = [
  ["M", 1000],                   
  ["CM", 900],
  ["D", 500],
  ["CD", 400],
  ["C", 100],
  ["XC", 90],
  ["L", 50],
  ["XL", 40],
  ["X", 10],
  ["IX", 9],
  ["V", 5],
  ["IV", 4],
  ["I", 1]
]

  def initialize(number)
    @number = number
  end

  def to_roman
    left_over = @number
    roman_numeral = ''

    ROMAN_NUMERALS.each do |v1, v2|
      if v2 <= left_over
        result = left_over / v2
        roman_numeral <<  v1 * result
        left_over -= v2 * result
      end
    end
    roman_numeral
  end
end
