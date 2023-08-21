class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :brand
      t.string :engine
      t.string :pickup_address
      t.integer :year
      t.integer :capacity
      t.integer :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
