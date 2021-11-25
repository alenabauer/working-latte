class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def new
    @cafe = Cafe.new
  end

  def index

    if params[:location].present?
      @cafes = Cafe.where(address: params[:location])
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

  def reservations
    @cafe = Cafe.find(params[:id])
    @reservation = Reservation.new
    @reservation.cafe = @cafe
    @reservation.user = current_user
    if @reservation.save
      redirect_to dashboard_path
    else
      render :show
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :address, :opening_hour, :closing_hour, :description, photos: [])
  end

  def reservation_params
    # params.require(:time_slot).permit(:start_time)
  end
end
