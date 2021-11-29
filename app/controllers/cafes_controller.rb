class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def new
    @cafe = Cafe.new
  end

  def index

    if params[:location].present?
      @cafes = Cafe.where("address ILIKE ?", "%#{params[:location]}%")
    elsif params[:near_me].present?
      if Rails.env.development?
        my_location = "Mediapark, Cologne"
        results = Geocoder.search(my_location)
        @cafes = Cafe.near(results.first.coordinates, 1)
      else
        @cafes = Cafe.near(request.location.coordinates, 4)
      end
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
    @review = Review.new
    @user_recent_reservation = Reservation.select do |r|
      r.cafe == @cafe && r.user == current_user
      # && r.date < Time.now
    end.last
    @all_reviews = Review.joins(:reservation).select { |r| r.reservation.cafe == @cafe }

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
