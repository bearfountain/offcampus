class Property < ActiveRecord::Base
	attr_accessible :description, :address, :laundry, :price, :unit, :square_footage, :bedrooms, :landlord_id, :user_id

	validates :address, :presence => true
	validates :description, :presence => true
	validates :bedrooms, :presence => true, :numericality => { :only_integer => true }
	validates :square_footage, :presence => true, :numericality => { :only_integer => true }

	belongs_to :landlord
end
