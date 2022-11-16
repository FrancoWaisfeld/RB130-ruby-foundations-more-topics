class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select do |candidate|
      word.downcase != candidate.downcase && anagram?(candidate)
    end
  end

  private

  attr_reader :word

  def anagram?(candidate)
    sorted_word(candidate) == sorted_word(word)
  end

  def sorted_word(text)
    text.downcase.chars.sort.join
  end
end
