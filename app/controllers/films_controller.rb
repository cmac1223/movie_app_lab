class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
    # Do SOME STUFF
    # Maybe you should initialize a new film
    # instance...
      @film = Film.new
  end

  def edit
    # DO MORE STUFF
    # FIND THE SPECIFIC FILM FIRST
      @film = Film.find(params[:id])
  end

  def create
    #Take info from the form action and make
    #a NEW instance of the film model    
    @film = Film.create!(film_params)
    redirect_to films_show_path(@film)
  end

  def update
    #Take info from the form action in the
    #edit view, and then UPDATE the 
    # specific instance of the film model
    @film = Film.find(params[:id])
    @film.update(film_params)
    redirect_to film_path(@film)
  end
  
  def delete
    #FIND which particular film you're deleting
    # (from the params)
    # and then take that instance, and DESTROY it
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to "/films"
  end

  
  private
  def film_params
      params.require(:film)
            .permit(:title, :year, :genre, :synopsis, :picture)
  end
    
end