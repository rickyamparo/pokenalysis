class Pokemon < ApplicationRecord
  validates :name, :health, :power, :speed, presence: true
  has_many :pokemonbattles
  has_many :battles, through: :pokemonbattles

  def stats
    health + power + speed
  end
end
