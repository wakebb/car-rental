class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :license
      t.string :cardinfo
      t.integer :user_type
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
