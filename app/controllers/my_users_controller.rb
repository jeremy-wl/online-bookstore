class MyUsersController < Devise::RegistrationsController

  def index
  	@users = User.all
  end

end