class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update]
  def index
    @places = Place.all.order(id: "DESC")
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    @place.save
    redirect_to place_path(@place)
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title, :body, :image).merge(user_id: current_user.id)
  end
end
