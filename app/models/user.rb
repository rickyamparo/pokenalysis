class User < ApplicationRecord
  has_secure_password

  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :battles

  enum role: ["default", "admin"]
end
