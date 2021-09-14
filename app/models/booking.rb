class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :user, uniqueness: { scope: :service_id }
end
