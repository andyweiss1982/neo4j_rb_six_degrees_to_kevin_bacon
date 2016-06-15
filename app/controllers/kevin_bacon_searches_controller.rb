class KevinBaconSearchesController < ApplicationController

  def new
    @actors = Actor.all
  end

  def create
    @actor = Actor.find(params[:actor])
    # @shortest_path =
    render :show
  end

  def show
  end

end