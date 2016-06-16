class SearchesController < ApplicationController

  def new
    @actors = Actor.all
  end

  def create
    @actor_one = Actor.find(params[:actor_one])
    @actor_two = Actor.find(params[:actor_two])
    @paths = @actor_one.coworkers(:coworker, :worked_with, rel_length: :any).where('coworker.name = {name}').params(name: @actor_two.name)

    render :show
  end

  def show
  end

end