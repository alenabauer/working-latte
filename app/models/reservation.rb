class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :chair
  belongs_to :cafe, through: :chair
  has_many :reviews

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
