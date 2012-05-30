class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
    	t.string :name
    	t.string :phone
    	t.string :email
    	t.boolean :hide_contact,
        t.boolean :hide_email
    	
    	t.timestamps
    end
  end
end
