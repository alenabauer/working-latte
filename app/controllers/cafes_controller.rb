class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def new
    @cafe = Cafe.new
  end

  def index
    if params[:location].present?
      session[:location] = params[:location]
      @location = session[:location]
      @cafes = Cafe.where("address ILIKE ?", "%#{params[:location]}%")
      if params[:date].present?
        session[:date] = params[:date]
        @date = session[:date]
        cafes = @cafes.select { |cafe| cafe.free_time_slots?(params[:date]) }
        @cafes = Cafe.where(id: cafes.map(&:id))
      end
    elsif params[:near_me].present?
      session[:near_me] = params[:near_me]
      @nearme = session[:near_me]
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

    tags_array = []
    @quiet = Tag.find_by(name:"quiet") if params["quiet"].present?
    tags_array << @quiet if params["quiet"].present?
    @pet = Tag.find_by(name:"pet friendly") if params["pet friendly"].present?
    tags_array << @pet if params["pet friendly"].present?
    @social = Tag.find_by(name:"social") if params["social"].present?
    tags_array << @social if params["social"].present?
    @vegan = Tag.find_by(name:"vegan") if params["vegan"].present?
    tags_array << @vegan if params["vegan"].present?
    @food = Tag.find_by(name:"food") if params["food"].present?
    tags_array << @food if params["food"].present?
    tags_array_converted = Tag.where(id: tags_array.map(&:id))

    cafes = @cafes.joins(:cafe_tags).joins(:tags).where(tags: tags_array_converted).uniq if tags_array != []
    @cafes = Cafe.where(id: cafes.map(&:id)) if tags_array != []

    @markers = @cafes.geocoded.map do |cafe|
      {
        lat: cafe.latitude,
        lng: cafe.longitude,
        info_window: render_to_string(partial: "info_window", locals: { cafe: cafe })
      }
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
    @chair = @cafe.chairs.max { |chair| chair.time_slots.reject { |ts| Reservation.where(time_slot: ts) }.count }
    @reservation = Reservation.new
    @review = Review.new
    @user_recent_reservation = Reservation.select do |r|
      r.cafe == @cafe && r.user == current_user && r.date < Time.now
    end.last
    @all_reviews = Review.order(created_at: :desc).joins(:reservation).select { |r| r.reservation.cafe == @cafe }

    session[:location] = "" if session[:near_me] == "true"

    @markers = [{ lat: @cafe.latitude,
                  lng: @cafe.longitude,
                  info_window: render_to_string(partial: "info_window", locals: { cafe: @cafe })
                }]
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

  def directions
    @cafe = Cafe.find(params[:id])
    @markers = [{ lat: @cafe.latitude,
                  lng: @cafe.longitude }]
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
    params.require(:cafe).permit(:name, :address, :opening_hour, :closing_hour, :description, photos: [], menus: [])
  end

  def create_cafe_tags
    params[:cafe][:tag_ids].reject {|id| id == "" }.each do |id|
      CafeTag.create(tag_id: id, cafe: @cafe)
    end
  end
end
