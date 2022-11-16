=begin

input: string
output: integer

explicit rules
- given a word, compute the Scrabble score

implicit rules
- create a Scrable class
- create a constructor method that takes a string argument and saves it
- create a score instance method that returns the Scrabble score of saved word
- nil returns 0
- case insensitive
- whitespace returns 0
- empty word returns 0


=end

class Scrabble
  TILE_SCORES = {
    'a' => 1,
    'e' => 1,
    'i' => 1,
    'o' => 1,
    'u' => 1,
    'l' => 1,
    'n' => 1,
    'r' => 1,
    's' => 1,
    't' => 1,
    'd' => 2,
    'g' => 2,
    'b' => 3,
    'c' => 3,
    'm' => 3,
    'p' => 3,
    'f' => 4,
    'h' => 4,
    'v' => 4,
    'w' => 4,
    'y' => 4,
    'k' => 5,
    'j' => 8,
    'x' => 8,
    'q' => 10,
    'z' => 10
  }
  TILE_SCORES.default = 0

  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.downcase.gsub(/[^a-z]/, '').chars

    score = 0
    letters.each { |letter| score += TILE_SCORES[letter.downcase] }
    score
  end

  def self.score(score_word)
    Scrabble.new(score_word).score
  end

  private

  attr_reader :word
end