class Chair < ApplicationRecord
  belongs_to :cafe
  has_many :reservations
end
