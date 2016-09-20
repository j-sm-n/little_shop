class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

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

  def edit
    @user = current_user
  end
end
