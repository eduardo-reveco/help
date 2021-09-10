class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :price, :description, presence: true
  has_one_attached :photo
end
