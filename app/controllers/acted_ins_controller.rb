class ActedInsController < ApplicationController
  before_action :set_acted_in, only: [:show, :edit, :update, :destroy]
  before_action :set_actor_and_movie, only: [:create, :update]
  before_action :set_actors_and_movies, only: [:new, :edit]

  # GET /acted_ins
  # GET /acted_ins.json
  def index
    @acted_ins = ActedIn.all
  end

  # GET /acted_ins/1
  # GET /acted_ins/1.json
  def show
  end

  # GET /acted_ins/new
  def new
    @acted_in = ActedIn.new
  end

  # GET /acted_ins/1/edit
  def edit
  end

  # POST /acted_ins
  # POST /acted_ins.json
  def create
    @acted_in = ActedIn.new(acted_in_params.merge(rel_params))

    respond_to do |format|
      if @acted_in.save
        format.html { redirect_to @acted_in, notice: 'Acted in was successfully created.' }
        format.json { render :show, status: :created, location: @acted_in }
      else
        format.html { render :new }
        format.json { render json: @acted_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acted_ins/1
  # PATCH/PUT /acted_ins/1.json
  def update
    respond_to do |format|
      if @acted_in.update(acted_in_params)
        format.html { redirect_to @acted_in, notice: 'Acted in was successfully updated.' }
        format.json { render :show, status: :ok, location: @acted_in }
      else
        format.html { render :edit }
        format.json { render json: @acted_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acted_ins/1
  # DELETE /acted_ins/1.json
  def destroy
    @acted_in.destroy
    respond_to do |format|
      format.html { redirect_to acted_ins_url, notice: 'Acted in was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acted_in
      @acted_in = ActedIn.find(params[:id])
    end

    def set_actor_and_movie
      @movie = Movie.find(params[:movie])
      @actor = Actor.find(params[:actor])
    end

    def set_actors_and_movies
      @actors = Actor.all
      @movies = Movie.all
    end

    def rel_params
      {from_node: @actor, to_node: @movie}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acted_in_params
      params.require(:acted_in).permit(:role)
    end
end
