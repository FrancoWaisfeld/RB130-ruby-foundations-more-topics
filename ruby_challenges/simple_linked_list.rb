class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @elements = []
  end

  def push(value)
    elements.unshift(Element.new(value, elements.first))
  end

  def peek
    return nil if elements.first.nil?
    elements.first.datum
  end

  def head
    elements.first
  end

  def size
    elements.size
  end

  def empty?
    elements.empty?
  end

  def pop
    elements.shift.datum
  end

  def self.from_a(arr)
    list = new
    return list if arr.nil?
    arr.reverse.each { |value| list.push(value) }
    list
  end

  def to_a
    elements.map(&:datum)
  end

  def reverse
    list = self.class.new
    elements.each { |element| list.push(element.datum) }
    list
  end

  private

  attr_reader :elements
end
