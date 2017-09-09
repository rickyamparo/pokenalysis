class PokemonsController < ApplicationController

  def battle
    @pokemonbattle = PokemonBattle.new
  end

  def database
  end

end
