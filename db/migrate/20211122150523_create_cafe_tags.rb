class CreateCafeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_tags do |t|
      t.references :cafe, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
