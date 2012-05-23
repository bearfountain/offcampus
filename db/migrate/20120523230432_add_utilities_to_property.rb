class AddUtilitiesToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :utilities, :string
  end
end