class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_secure_password
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
end
