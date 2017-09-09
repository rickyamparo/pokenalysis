class BattlesController < ApplicationController

  def new
  end

  def create
    @pokemon_1 = Pokemon.find(params[:post][:pokemon_1_id])
    @pokemon_2 = Pokemon.find(params[:post][:pokemon_2_id])
    winner = decide_winner(@pokemon_1, @pokemon_2)
    @battle = Battle.create(winner: winner, pokemon_1: @pokemon_1.name, pokemon_2: @pokemon_2.name)
    flash[:winner] = "#{winner.name} was the winner"
    redirect_to battle_path
  end

  private

  def decide_winner(pokemon_1, pokemon_2)
    pokemon_1_stats = pokemon_1.stats
    pokemon_2_stats = pokemon_2.stats
    if pokemon_1_stats > pokemon_2_stats
      pokemon_1
    else
      pokemon_2
    end
  end
  # Need to add a condition for when it's a draw

end
