class Service < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :bookings, dependent: :destroy
end
