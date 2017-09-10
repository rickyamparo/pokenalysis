class BattlesController < ApplicationController

  def new
  end

  def create
    @pokemon_1 = Pokemon.find(params[:post][:pokemon_1_id])
    @pokemon_2 = Pokemon.find(params[:post][:pokemon_2_id])
    winner = decide_winner(@pokemon_1, @pokemon_2)
    @battle = Battle.create(winner: winner, pokemon_1: @pokemon_1.name, pokemon_2: @pokemon_2.name)
    if winner.nil?
      flash[:draw] = "This battle was a draw"
    else
      flash[:winner] = "#{winner.name} was the winner"
    end
    redirect_to battle_path
  end

  private

  def decide_winner(pokemon_1, pokemon_2)
    pokemon_1_stats = pokemon_1.stats
    pokemon_2_stats = pokemon_2.stats
    if pokemon_1_stats > pokemon_2_stats
      pokemon_1
    elsif pokemon_1_stats < pokemon_2_stats
      pokemon_2
    else
      nil
    end
  end


end
