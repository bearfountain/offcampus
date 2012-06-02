class Property < ActiveRecord::Base
	attr_accessible :description, :address, :laundry, :price, :unit, :square_footage, :bedrooms, :landlord_id, :user_id, :featured, :photos_attributes, :summer, :utilities, :rooms, :parking

	validates :address, :presence => true
	validates :description, :presence => true
	validates :bedrooms, :presence => true, :numericality => { :only_integer => true }
	validates :square_footage, :presence => true, :numericality => { :only_integer => true }
	validates :price, :presence => true, :numericality => true

	belongs_to :landlord

	has_many :photos

	accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => proc { |attributes| attributes['photo'].nil? and attributes['id'].blank? }

	def self.highest_price
		if @max_price == nil
			@max_price = Property.maximum("price")
		else
			return @max_price
		end
	end

	def featured_photo
		return nil if(photos.length == 0)

		photos.each do |photo|
			return photo if photo.main == true
		end

		return photos[0]
	end

	def has_photo?
		return false if photos == nil
		return photos.length > 0
	end

	def self.bedroom_counts
		Property.group("bedrooms").count()
	end

	def self.bedroom_counts_condensed
		counts = self.bedroom_counts

		counts[6] = 0 if counts[6] == nil

		counts.each do |count|
			counts[6] += count[1] if count[0] > 6
		end

		return counts
	end
end
