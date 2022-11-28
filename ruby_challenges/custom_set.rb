class CustomSet
  def initialize(arr = [])
    @set = arr.uniq.sort
  end

  def ==(other)
    set == other.set
  end

  def empty?
    set.empty?
  end

  def contains?(number)
    set.include?(number)
  end

  def subset?(otherset)
    set.all? { |number| otherset.set.include?(number) }
  end

  def disjoint?(otherset)
    set.none? { |number| otherset.set.include?(number) }
  end

  def eql?(other)
    self == other
  end

  def add(number)
    self.set = set.push(number).uniq.sort
    self
  end

  def intersection(other)
    CustomSet.new(set.intersection(other.set))
  end

  def difference(other)
    CustomSet.new(set.difference(other.set))
  end

  def union(other)
    CustomSet.new(set.union(other.set))
  end

  protected

  attr_accessor :set
end
