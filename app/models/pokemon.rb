class Pokemon < ApplicationRecord
  validates :name, :health, :power, :speed, presence: true
  has_many :pokemon_battles
  has_many :battles, through: :pokemon_battles

  def stats
    health + power + speed
  end
end
