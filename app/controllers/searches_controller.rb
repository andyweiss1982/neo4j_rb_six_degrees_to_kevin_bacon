class SearchesController < ApplicationController

  def new
    @actors = Actor.all
  end

  def create
    @actor_one = Actor.find(params[:actor_one])
    @actor_two = Actor.find(params[:actor_two])

    paths = @actor_one.coworkers(:coworker, :worked_with, rel_length: :any)
      .where('coworker.name = {name}').params(name: @actor_two.name)
      .pluck(:worked_with)
      .reject{|path_array| path_array.map{|worked_with| worked_with.to_node == @actor_one}.include?(true) }
      .sort_by(&:size).first(3)

    @path_strings = paths.map{|path| path_to_s(path) }

    render :show
  end

  def show
  end

  private

  def path_to_s(path)
    "#{@actor_one.name} " + path.map do |worked_with|
                              "(#{worked_with.movie}) => #{worked_with.to_node.name}"
                            end.join(" ")
  end

end