class PropertiesController < ApplicationController
	def index
		@properties = Property.all
	end

	def show
		@property = Property.find(params[:id])
	end

	def new
		@property = Property.new
	end

	def create
		@property = Property.new(params[:property])

		if(@property.save)
			redirect_to @property
		else
			render :action => 'new'
		end
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
    	@entry.attributes = params[:entry]

    	if @entry.save
      		flash[:notice] = "Entry was successfully updated"
       		redirect_to :action => "show", :id => @entry
     	else
       		render 'edit'
     	end
	end

	def destroy
		Property.find(params[:id]).destroy
		redirect_to :action => 'index'
	end
end
