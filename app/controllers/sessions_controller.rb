class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name])
  	if user && user.authenticate(params[:session][:password])
  		login user
  		redirect_to user
  	else
  		flash.now[:error] = "Invalid name and password"
  		render 'new'
  	end
  end

  def destroy
  	logout
  	redirect_to root_path
  end
end
