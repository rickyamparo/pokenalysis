class AnalysisController < ApplicationController
  def index
  end

  def create
    @current_user = User.find(params[:post][:user_id])
    render :index
  end

end
