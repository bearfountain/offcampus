class Property < ActiveRecord::Base
	attr_accessible :description, :address, :laundry, :price, :unit, :square_footage, :bedrooms, :landlord_id, :user_id, :featured, :photos_attributes

	validates :address, :presence => true
	validates :description, :presence => true
	validates :bedrooms, :presence => true, :numericality => { :only_integer => true }
	validates :square_footage, :presence => true, :numericality => { :only_integer => true }
	validates :price, :presence => true, :numericality => true

	belongs_to :landlord

	has_many :photos

	accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes['photo'].nil? and attributes['id'].blank? }
end
