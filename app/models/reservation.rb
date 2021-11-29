class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :chair
  has_many :reviews, dependent: :destroy
  has_many :reservation_time_slots
  has_many :time_slots, through: :reservation_time_slots

  # validates :date, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true
end
