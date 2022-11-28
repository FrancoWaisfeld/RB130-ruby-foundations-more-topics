class Clock
  def initialize(minutes)
    @minutes = minutes
  end

  def self.at(hours, min = 0)
    new(convert_to_minutes(hours, min))
  end

  def to_s
    hours, min = minutes.divmod(60)
    format('%02d:%02d', hours, min)
  end

  def +(min)
    total_minutes = minutes + min
    Clock.at(0, total_minutes)
  end

  def -(min)
    total_minutes = minutes - min
    Clock.at(0, total_minutes)
  end

  def ==(other)
    minutes == other.minutes
  end

  protected

  attr_reader :minutes

  class << self
    private

    def convert_to_minutes(hours, min)
      ((hours * 60) + min) % 1440
    end
  end
end
