class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :rating, :comment, presence: true
end
