class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  		redirect_to store_url
  	end
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end  
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: "Successfully logged out."
  end
end
