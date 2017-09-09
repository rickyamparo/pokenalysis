class Pokemon < ApplicationRecord
  validates :name, :health, :power, :speed, presence: true
  has_many :battles, through: :pokemonbattles
end
