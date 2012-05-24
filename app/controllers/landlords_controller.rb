class LandlordsController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
		@landlord = Landlord.find(current_user)
	end
end
