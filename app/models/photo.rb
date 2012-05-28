class Photo < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>"}
	attr_accessible :photo, :main
	
	belongs_to :property
end