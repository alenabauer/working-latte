class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def new
    @cafe = Cafe.new
  end

  def index
    if params[:location].present?
      @cafes = Cafe.where("address ILIKE ?", "%#{params[:location]}%")
    else
      @cafes = Cafe.all
    end

    @markers = @cafes.geocoded.map do |cafe|
      {
        lat: cafe.latitude,
        lng: cafe.longitude
      }
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
    @reservation = Reservation.new

    @markers = [{ lat: @cafe.latitude, lng: @cafe.longitude }]
  end

  def create
    @cafe = Cafe.new(cafe_params)
    @cafe.user = current_user
    if @cafe.save
      create_cafe_tags
      redirect_to @cafe, notice: 'We welcome your Cafe to Working Latte'
    else
      render :new
    end
  end

  def add_chair
    Chair.create(cafe: Cafe.find(params[:id]))
  end

  def favorite_cafe
    @cafe = Cafe.find(params[:id])
    current_user.favorite(@cafe)
    redirect_to @cafe
  end

  def unfavorite_cafe
    @cafe = Cafe.find(params[:id])
    current_user.unfavorite(@cafe)
    redirect_to @cafe
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :address, :opening_hour, :closing_hour, :description, photos: [])
  end

  def create_cafe_tags
    params[:cafe][:tag_ids].reject {|id| id == "" }.each do |id|
      CafeTag.create(tag_id: id, cafe: @cafe)
    end
  end
end
