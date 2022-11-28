class Diamond
  def self.make_diamond(middle_letter)
    letters = ('A'..middle_letter).to_a
    rows = generate_rows(letters)
    (rows + rows[0..-2].reverse).join("\n") + "\n"
  end

  class << self
    private

    def generate_rows(letters)
      rows = []
      spaces = 1
      letters.each do |letter|
        if letter == 'A'
          rows << letter
        else
          rows << "#{letter}#{' ' * spaces}#{letter}"
          spaces += 2
        end
      end
      rows = add_outside_spaces(rows)
    end

    def add_outside_spaces(rows)
      longest_line = rows.max_by(&:length).size
      rows.map do |row|
        spaces = (longest_line - row.size) / 2
        "#{' ' * spaces}#{row}#{' ' * spaces}"
      end
    end
  end
end
