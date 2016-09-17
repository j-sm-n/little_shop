class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
  end

end
