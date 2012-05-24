class PagesController < ApplicationController
	def home
		@properties = Property.all

		@featured = Property.where("featured = ?", 1).limit(4)
	end
end