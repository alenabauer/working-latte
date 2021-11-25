class ReservationTimeSlot < ApplicationRecord
  belongs_to :time_slot
  belongs_to :reservation
end
