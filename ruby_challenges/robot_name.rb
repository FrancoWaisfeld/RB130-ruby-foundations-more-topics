class Robot
  ALPHABET = ('A'..'Z').to_a.freeze
  NUMBERS = ('0'..'9').to_a.freeze

  @@robot_names = []

  def name
    return @robot_name if @robot_name

    @robot_name = generate_random_unique_name
    @@robot_names << @robot_name
    @robot_name
  end

  def reset
    @@robot_names.delete(@robot_name)
    @robot_name = nil
  end

  private

  def generate_random_unique_name
    random_name = "#{ALPHABET.sample}#{ALPHABET.sample}#{NUMBERS.sample}"\
    "#{NUMBERS.sample}#{NUMBERS.sample}"

    until !@@robot_names.include?(random_name)
      random_name = "#{ALPHABET.sample}#{ALPHABET.sample}#{NUMBERS.sample}"\
                    "#{NUMBERS.sample}#{NUMBERS.sample}"
    end
    random_name
  end
end
