class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:password]) && user.is_admin?
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    elsif user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Username and/or Password is invalid. Try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have logged out"
    redirect_to login_path
  end
end
