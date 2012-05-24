class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :address
    	t.text :description
    	t.float :price
    	t.string :unit
    	t.integer :bedrooms
    	t.integer :square_footage
    	t.boolean :laundry
      t.integer :landlord_id
      t.boolean :featured
     	t.timestamps
    end
  end
end
