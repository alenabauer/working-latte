class Cafe < ApplicationRecord
  HOURS = (6..24).to_a.freeze
  belongs_to :user
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  has_many :chairs
  has_many :reservations, through: :chairs
  has_many_attached :photos

  validates :name, presence: true
  validates :address, presence: true
  validates :opening_hour, presence: true
  validates :closing_hour, presence: true
  # validates :description, length: { minimum: 50 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
