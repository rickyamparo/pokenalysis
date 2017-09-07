class Pokemon < ApplicationRecord
  validates :name, :health, :power, :speed, presence: true
end
