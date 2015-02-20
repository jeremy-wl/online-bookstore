class UsersController < Devise::RegistrationsController
	load_and_authorize_resource

  def index
  	@users = User.all
  end

  #######################################################################
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  #### Overwrites Devise methods because this controller is "special" ####
end

