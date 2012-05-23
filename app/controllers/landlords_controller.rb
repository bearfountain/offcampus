class LandlordsController < ApplicationController
  # GET /landlords
  # GET /landlords.json
  def index
    @landlords = Landlord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @landlords }
    end
  end

  # GET /landlords/1
  # GET /landlords/1.json
  def show
    @landlord = Landlord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @landlord }
    end
  end

  # GET /landlords/new
  # GET /landlords/new.json
  def new
    @landlord = Landlord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @landlord }
    end
  end

  # GET /landlords/1/edit
  def edit
    @landlord = Landlord.find(params[:id])
  end

  # POST /landlords
  # POST /landlords.json
  def create
    @landlord = Landlord.new(params[:landlord])

    respond_to do |format|
      if @landlord.save
        format.html { redirect_to @landlord, notice: 'Landlord was successfully created.' }
        format.json { render json: @landlord, status: :created, location: @landlord }
      else
        format.html { render action: "new" }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /landlords/1
  # PUT /landlords/1.json
  def update
    @landlord = Landlord.find(params[:id])

    respond_to do |format|
      if @landlord.update_attributes(params[:landlord])
        format.html { redirect_to @landlord, notice: 'Landlord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1
  # DELETE /landlords/1.json
  def destroy
    @landlord = Landlord.find(params[:id])
    @landlord.destroy

    respond_to do |format|
      format.html { redirect_to landlords_url }
      format.json { head :no_content }
    end
  end
end
