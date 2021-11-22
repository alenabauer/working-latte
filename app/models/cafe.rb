class Cafe < ApplicationRecord
  belongs_to :user
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  has_many :chairs
  has_many :reservations, through: :chairs

  validates :name, presence: true
  validates :address, presence: true
  validates :open_hour, presence: true
  validates :close_hour, presence: true
  validates :description, length: { minimum: 100 }
end
