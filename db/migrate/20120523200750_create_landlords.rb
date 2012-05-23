class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :first
      t.string :last
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
