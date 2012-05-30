class LandlordsController < ApplicationController
	before_filter :authenticate_user!

	def dashboard
		@landlord = Landlord.find(current_user)
	end

	# PUT /landlords/1
  	# PUT /landlords/1.json
	def update
		@landlord = Landlord.find(params[:id])

		respond_to do |format|
		  if @landlord.update_attributes(params[:landlord])
		    format.html { redirect_to @landlord, notice: 'Property was successfully updated.' }
		    format.json { head :no_content }
		  else
		    format.html { render action: "edit" }
		    format.json { render json: @landlord.errors, status: :unprocessable_entity }
		  end
		end
	end
end
