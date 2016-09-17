class OrdersController < ApplicationController
  before_action :require_current_user, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def require_current_user
    render file: "/public/404" unless current_user_order?
  end
end
