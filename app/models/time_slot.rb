class TimeSlot < ApplicationRecord
  belongs_to :chair

  def to_label
    "#{start_time.hour}:00"
  end
end
