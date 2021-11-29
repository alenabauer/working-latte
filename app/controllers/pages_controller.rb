class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if Rails.env.development?
      ip = "192.168.1.201"
      results = Geocoder.search(ip)
      @cafes = Cafe.near(results.first.coordinates, 4)
    else
      @cafes = Cafe.near(request.location.coordinates, 4)
    end
  end
end
