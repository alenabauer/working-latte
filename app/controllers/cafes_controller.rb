class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

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
end
