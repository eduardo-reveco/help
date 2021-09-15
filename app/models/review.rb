class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :rating, :comment, presence: true
  validates :rating, inclusion: { in: 1..5 }, numericality: { only_integer: true }
end
