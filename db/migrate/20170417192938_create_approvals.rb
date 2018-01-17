class CreateApprovals < ActiveRecord::Migration[5.0]
  def change
    create_table :approvals do |t|
      t.integer :status
      t.text :comment
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end
