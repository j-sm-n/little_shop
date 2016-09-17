class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart

  helper_method :current_user, :current_admin?

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def path_based_on_role
    if current_admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :gender)
  end

end
