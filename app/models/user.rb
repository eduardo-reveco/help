class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = %w[facilitador cliente]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services
  has_many :bookings

  validates :rol, inclusion: { in: ROLES, allow_nil: false, message: "Escoge entre: facilitador o cliente" }
end
