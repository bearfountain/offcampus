class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.primary_key :id
      t.string :address, :null => false
      t.text :description
      t.integer :bedrooms
      t.integer :square_footage
      t.boolean :laundry, :default => false
      t.decimal :price
      t.string :unit

      t.timestamps
    end
  end
end
