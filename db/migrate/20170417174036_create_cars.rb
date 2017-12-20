class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :regnumber
      t.string :model
      t.integer :capacity
      t.integer :start_mileage
      t.integer :status
      t.float :curr_rate
      t.string :pickup_address

      t.timestamps
    end
  end
end
