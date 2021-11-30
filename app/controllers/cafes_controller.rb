class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def new
    @cafe = Cafe.new
  end

  def index
    if params[:location].present?
      session[:location] = params[:location]
      @cafes = Cafe.where("address ILIKE ?", "%#{params[:location]}%")
      if params[:date].present?
         session[:date] = params[:date]
         cafes = @cafes.select { |cafe| cafe.free_time_slots?(params[:date]) }
         @cafes = Cafe.where(id: cafes.map(&:id))
      end
    elsif params[:near_me].present?
      session[:near_me] = params[:near_me]
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
        lng: cafe.longitude,
        info_window: render_to_string(partial: "info_window", locals: { cafe: cafe })
      }
    end

    #implement filters from show page  -  depending on checked tags
    # create separate if / else statements for the query depending on the params (tag?)
    # join tables?
    #  if params[:query].present?
    #iterate over the tags array, for each tag -> the list of cafes that we find -> iterate over again and show in the index
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

    @cafes = Cafe.joins(:cafe_tags).joins(:tags).where(tags: tags_array_converted).uniq if tags_array != []
    # @cafes = @cafes.select { |cafe| cafe.tags.includes(tags_array) } if tags_array != []
    # raise
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

    if session[:near_me] == "true"
      session[:location] = ""
    end

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
