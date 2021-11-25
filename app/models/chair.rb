class Chair < ApplicationRecord
  belongs_to :cafe
  has_many :reservations
  has_many :time_slots

  after_create :create_time_slots

  def create_time_slots
    for_current_month
    for_next_month
  end

  def for_current_month
    year = created_at.year
    month = created_at.month
    day = created_at.day + 1
    while day <= created_at.end_of_month.day
      hour = cafe.opening_hour
      while hour < cafe.closing_hour
        generate_four_slots(year, month, day, hour)
        hour += 1
      end
      day += 1
    end
  end

  def for_next_month
    year = created_at.month < 12 ? created_at.year : created_at.year + 1
    month = created_at.month < 12 ? created_at.month + 1 : 1
    day = 1
    x = DateTime.new(year, month, day)
    while day <= x.end_of_month.day
      hour = cafe.opening_hour
      while hour < cafe.closing_hour
        generate_four_slots(year, month, day, hour)
        hour += 1
      end
      day += 1
    end
  end

  def generate_four_slots(year, month, day, hour)
    [0, 15, 30, 45].each do |min|
      datetime = DateTime.new(year, month, day, hour, min, 0)
      TimeSlot.create!(chair: self, duration: 15, start_time: datetime)
    end
  end
end
