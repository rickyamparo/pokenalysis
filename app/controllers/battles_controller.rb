class BattlesController < ApplicationController

  def new
  end

  def create
    @battle.create()
  end

end
