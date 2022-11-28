class Meetup
  TEENTH = [13, 14, 15, 16, 17, 18, 19]

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(week_day, nth)
    week_days = find_week_days(week_day)
    find_nth(week_days, nth)
  end

  private

  def find_week_days(week_day)
    first_day_month = Date.new(year, month, 1)
    last_day_month = Date.new(year, month, -1)

    (first_day_month..last_day_month).to_a.select do |date|
      date.cwday == numeric_week_day(week_day)
    end
  end

  def find_nth(week_days, nth)
    case nth.downcase
    when 'first'
      week_days[0]
    when 'second'
      week_days[1]
    when 'third'
      week_days[2]
    when 'fourth'
      week_days[3]
    when 'fifth'
      week_days[4]
    when 'last'
      week_days.last
    when 'teenth'
      week_days.detect do |date|
        TEENTH.include?(date.day)
      end
    end
  end

  def numeric_week_day(week_day)
    case week_day.downcase
    when 'monday'
      1
    when 'tuesday'
      2
    when 'wednesday'
      3
    when 'thursday'
      4
    when 'friday'
      5
    when 'saturday'
      6
    when 'sunday'
      7
    end
  end
end
