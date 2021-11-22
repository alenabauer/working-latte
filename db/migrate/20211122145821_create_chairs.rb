class CreateChairs < ActiveRecord::Migration[6.1]
  def change
    create_table :chairs do |t|
      t.references :cafe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
