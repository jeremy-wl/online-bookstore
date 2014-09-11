class UsersController < Devise::RegistrationsController
	load_and_authorize_resource

  def index
  	@users = User.all
  end

end