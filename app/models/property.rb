class Property < ActiveRecord::Base
  attr_accessible :address, :description, :bedrooms, :square_footage, :laundry, :price, :unit
  belongs_to :landlord
  validates :address, :presence => true
end