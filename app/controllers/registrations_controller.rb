# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource({})
    resource.build_landlord
    respond_with resource
  end

  def create
    puts "test"
  	build_resource

  	if resource.save
      @landlord = Landlord.new()
      @landlord.user_id = resource.id
      @landlord.email = resource.email
      @landlord.hide_email = false
      @landlord.save

      @landlord.errors.inspect

	  	if resource.active_for_authentication?
	        set_flash_message :notice, :signed_up if is_navigational_format?
	        sign_in(resource_name, resource)
	        respond_with resource, :location => after_sign_up_path_for(resource)
	      else
	        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
	        expire_session_data_after_sign_in!
	        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
	      end
	    else
	      clean_up_passwords resource
	      respond_with resource
	    end
  end

  def update
    super
  end

  def cancel
    super
  end

  def destroy
    super
  end
end 
