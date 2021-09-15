class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :price, :description, presence: true
  has_one_attached :photo
  has_many :reviews

  def average
    return self.reviews.map { |r| r.rating }.sum / self.reviews.count if self.reviews.count > 0
    0
  end

end
