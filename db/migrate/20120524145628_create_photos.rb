class CreatePhotos < ActiveRecord::Migration
  def up
  	create_table :photos do |t|
    	t.has_attached_file :photo
    	t.integer :property_id
	t.boolean :main
    end
  end

  def down
  end
end
