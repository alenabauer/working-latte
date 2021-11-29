class Cafe < ApplicationRecord
  HOURS = (6..24).to_a.freeze
  belongs_to :user
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  has_many :chairs
  has_many :time_slots, through: :chairs
  has_many :reservations, through: :chairs
  has_many :reviews, through: :reservations
  has_many_attached :photos
  has_many_attached :menus

  validates :name, presence: true
  validates :address, presence: true
  validates :opening_hour, presence: true
  validates :closing_hour, presence: true
  validates :description, length: { minimum: 50 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  acts_as_favoritable


  def self.having_time_slot_on(date)
    Cafe.joins(:chairs).joins(:time_slots).where("date_trunc('day', start_time)::date = ?", date).distinct
  end

  def free_time_slots?(date)
    ts = time_slots.where("date_trunc('day', start_time)::date = ?", date)
    free_slots = ts.select do |time_slot|
      time_slot.reservation_time_slots.empty?
    end
    # p free_slots
    free_slots.any?
  end

  after_create :create_chairs

  def create_chairs
    5.times do
      Chair.create!(cafe: self)
    end
  end

  def avg_rating
    reviews.map(&:rating).sum / reviews.count.to_f
  end
end
