class DNA
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(mutated_strand)
    shorter_strand, longer_strand = [strand, mutated_strand].sort_by(&:size)

    differences = 0

    shorter_strand.chars.each_with_index do |nucleotide, index|
      differences += 1 if nucleotide != longer_strand[index]
    end
    differences
  end

  private

  attr_reader :strand
end
