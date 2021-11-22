class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.integer :opening_hour
      t.integer :closing_hour
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
