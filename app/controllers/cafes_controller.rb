class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def new
    @cafe = Cafe.new
  end

  def index
    @cafes = Cafe.all

    @markers = @cafes.geocoded.map do |cafe|
      {
        lat: cafe.latitude,
        lng: cafe.longitude
      }
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def create
    @cafe = Cafe.new(cafe_params)
    @cafe.user = current_user

    if @cafe.save
      redirect_to @cafe, notice: 'We welcome your Cafe to Working Latte'
    else
      render :new
    end
  end

  def add_chair
    Chair.create(cafe: Cafe.find(params[:id]))
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :address, :opening_hour, :closing_hour, :description, photos: [])
  end
end
