class AddCoordinatesToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :latitude, :float
    add_column :cafes, :longitude, :float
  end
end
