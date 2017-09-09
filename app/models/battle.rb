class Battle < ApplicationRecord
  has_many :pokemon, through: :pokemonbattles
end
