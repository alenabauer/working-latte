class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :show ]

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find(params[:id])
  end
end
