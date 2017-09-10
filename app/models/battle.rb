class Battle < ApplicationRecord
  has_many :pokemonbattles
  has_many :pokemon, through: :pokemonbattles
end
