class TextAnalyzer
  def process
    sample_data = File.read('sample_text.txt')
    yield(sample_data)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |data| puts "#{data.split("\n\n").count} paragraphs" }
analyzer.process { |data| puts "#{data.split("\n").count} lines" }
analyzer.process { |data| puts "#{data.split(" ").count} words" }
