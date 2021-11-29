class FavoritesController < ApplicationController
  def index
    @cafes = current_user.favorited_by_type('Cafe')
  end
end
