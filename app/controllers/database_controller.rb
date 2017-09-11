class DatabaseController < ApplicationController

  def index
  end

  def create
    @current_pokemon = Pokemon.find(params[:post][:pokemon_id])
    render :index
  end

end
