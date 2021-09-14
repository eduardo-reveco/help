class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :user_id, uniqueness: true
end
