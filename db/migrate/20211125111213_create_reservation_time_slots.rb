class CreateReservationTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_time_slots do |t|
      t.references :time_slot, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
