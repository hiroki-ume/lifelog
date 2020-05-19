class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path
    else
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
