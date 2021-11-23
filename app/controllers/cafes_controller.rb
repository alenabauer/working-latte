class CafesController < ApplicationController
  skip_before_action :authenticate_user!, :only => :index

  def index
    @cafes = Cafe.all
  end
end
