class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :license
      t.timestamp :booking_time
      t.datetime :start_slot
      t.datetime :end_slot
      t.datetime :start_time
      t.datetime :end_time
      t.float :total_miles
      t.float :booking_rate
      t.references :User, foreign_key: true
      t.references :Car, foreign_key: true

      t.timestamps
    end
  end
end
