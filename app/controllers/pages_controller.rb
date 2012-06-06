class PagesController < ApplicationController
	def home
		@properties = Property.all

		@featured = Property.where("featured = ?", 1).limit(4)
	end

	def list
		@all = Property.all

		if(params[:bedrooms].nil?)
			@bedrooms = false
		else
			@bedrooms = params[:bedrooms].to_i
			@bedrooms = true if @bedrooms.to_i >= 6
		end

    	if user_signed_in?
      		@user = User.find(current_user)
    	end

		if(params[:low_price] and params[:high_price] and params[:bedrooms])
			if params[:bedrooms].to_i == 6
				@properties = Property.where("price >= ? AND price <= ? AND bedrooms >= 6", params[:low_price], params[:high_price])
			elsif params[:bedrooms].to_i == -1
				@properties = Property.where("price >= ? AND price <= ?", params[:low_price], params[:high_price])
			else
				@properties = Property.where("price >= ? AND price <= ? AND bedrooms = ?", params[:low_price], params[:high_price], params[:bedrooms])
			end
		
		elsif(params[:low_price] and params[:high_price])
	  		@properties = Property.where("price >= ? AND price <= ?", params[:low_price], params[:high_price]);
	  	
	  	elsif(params[:bedrooms])
	  		if(params[:bedrooms].to_i >= 6)
	  			@properties = Property.where("bedrooms >= 6");
	  		elsif params[:bedrooms].to_i == -1
	  			@properties = Property.all
	  		else
	  			@properties = Property.where("bedrooms = ?", params[:bedrooms])
	  		end

		else
			@properties = Property.all
		end

		@counts = Property.bedroom_counts_condensed

		@ajax = false

		if(params[:layout] == 'false')
			@ajax = true
			render :layout => false
		else
			render
		end
	end
end