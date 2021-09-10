class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = %w[facilitador cliente]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name, :last_name, :password, :email, presence: true


  has_many :services
  has_many :bookings

  validates :rol, inclusion: { in: ROLES, allow_nil: false, message: "Escoge entre: facilitador o cliente" }
end
