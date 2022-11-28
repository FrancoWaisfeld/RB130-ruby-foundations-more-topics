class Triangle
  attr_reader :kind, :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError, 'Invalid side lengths' unless valid?

    @kind = determine_kind
  end

  private

  def determine_kind
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?
    return 'scalene' if scalene?
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end

  def scalene?
    sides.uniq.size == 3
  end

  # rubocop:disable Metrics/AbcSize
  def valid?
    sides.all?(&:positive?) &&
      (sides[0] + sides[1]) > sides[2] &&
      (sides[0] + sides[2]) > sides[1] &&
      (sides[1] + sides[2]) > sides[0]
  end
  # rubocop:enable Metrics/AbcSize
end
