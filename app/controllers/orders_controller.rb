class OrdersController < ApplicationController
  before_action :require_current_user, only: [:show]
  before_action :logged_in?, only: [:show, :create]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create(user: current_user)
    @cart.contents.each do |item_id, quantity|
      order.ordered_items.create(item_id: item_id, quantity: quantity)
    end

    @cart.clear
    update_cart

    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  private

  def require_current_user
    render file: "/public/404" unless current_user_order? || current_admin?
  end
end
