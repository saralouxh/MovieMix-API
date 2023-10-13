class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show update destroy ]

  # GET /playlists/:id/movies
  def movies
    @playlist = Playlist.find(params[:id])
    @movies = @playlist.movies
    render json: @movies
  end

  # POST /playlists/:id/add_movie
  def add_movie
    @playlist = Playlist.find(params[:id])
    movie_data = params.permit(:title, :image) # Permit only title and image
    
    # Check if the 'image' and 'title' attributes are present in the incoming data
    if movie_data['image'].present?
      # Create a new Movie record using the received data
      @movie = Movie.create(
        title: movie_data['title'],
        image: movie_data['image']
      )
  
      unless @playlist.movies.include?(@movie)
        @playlist.movies << @movie
      end
    end
  
    payload = {
      playlist: @playlist,
      movies: @playlist.movies
    }
  
    render json: payload
  end

  # DELETE /playlists/:id/remove_movie
  def remove_movie
    @playlist = Playlist.find(params[:id])
    @movie = Movie.find(params[:movie_id])

    if @playlist.movies.include?(@movie)
      @playlist.movies.delete(@movie)
    end

    payload = {
      playlist: @playlist,
      movies: @playlist.movies
    }
  
    render json: payload
  end

  # GET /playlists
  def index
    @playlists = Playlist.all

    render json: @playlists
  end

  # GET /playlists/1
  def show
    render json: @playlist
  end

  # POST /playlists
  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      render json: @playlist, status: :created, location: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      render json: @playlist
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name)
    end
end
