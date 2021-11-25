class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.datetime :start_time
      t.integer :duration
      t.references :chair, null: false, foreign_key: true

      t.timestamps
    end
  end
end
