class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :price, :description, presence: true
  has_one_attached :photo
  has_many :reviews
end
