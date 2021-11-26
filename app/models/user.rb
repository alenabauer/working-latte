class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cafes
  has_many :reservations
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true

  acts_as_favoritor
end
