class Pokemonbattle < ApplicationRecord
  belongs_to :pokemon
  belongs_to :battle
end
