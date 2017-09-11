class Battle < ApplicationRecord
  validates :winner, :pokemon_1, :pokemon_2, presence: true
  has_many :pokemon_battles
  has_many :pokemon, through: :pokemon_battles
  belongs_to :user
end
