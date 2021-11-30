class TimeSlot < ApplicationRecord
  belongs_to :chair
  has_many :reservation_time_slots

  def to_label
    "#{start_time.hour}:00"
  end
end
