class SearchesController < ApplicationController

  def new
    @actors = Actor.all
  end

  def create
    @actor_one = Actor.find(params[:actor_one])
    @actor_two = Actor.find(params[:actor_two])

    paths = Neo4j::Session.current.query
      .match(
        "p=(a1:Actor)-[worked_w:worked_with*]->(a2:Actor)
        WHERE a1.uuid = {actor_one}
        AND a2.uuid = {actor_two}
        AND ALL( n IN nodes(p)[1..-1] WHERE n.uuid <> {actor_one})"
      ).params(
        actor_one: @actor_one.uuid,
        actor_two: @actor_two.uuid
      ).order(
        "length(p) ASC"
      ).limit(3)
      .pluck(:worked_w)

    @path_strings = paths.map{|path| path_to_s(path) }

    render :show
  end

  def index
    redirect_to new_search_path
  end

  private

  def path_to_s(path)
    "#{@actor_one.name} " + path.map do |worked_with|
                              "(#{worked_with.movie}) => #{worked_with.to_node.name}"
                            end.join(" ")
  end

end