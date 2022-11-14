class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)

    @list.save
    redirect_to list_path(@list)
  end

  def destroy
    @restaurant.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def params_list
    params.require(:list).permit(:name, :movie)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def movies_title
    movies = []
    Movie.all.each { |movie| movies << movie.title }
    return movies
  end
end
