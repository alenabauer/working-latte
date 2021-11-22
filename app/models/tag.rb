class Tag < ApplicationRecord
  has_many :cafes, through: :cafe_tags

  validates :name, presence: true
  validates :description, presence: true
end
