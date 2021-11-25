class Tag < ApplicationRecord
  CATEGORIES = Tag.all.map {|tag| tag.name}
  has_many :cafes, through: :cafe_tags

  validates :name, presence: true
  # validates :description, presence: true
end
