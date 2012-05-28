class PagesController < ApplicationController
	def home
		@properties = Property.all

		@featured = Property.where("featured = ?", 1).limit(4)
	end

	def list
		@properties = Property.all
	end
end