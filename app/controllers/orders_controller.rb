class OrdersController < ApplicationController
  before_action :require_current_user, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create(user: current_user)
    @cart.contents.each do |item_id, quantity|
      quantity.times do
        order.ordered_items.create(item_id: item_id)
      end
    end

    @cart.clear
    # session[:cart] = @cart

    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  private

  def require_current_user
    render file: "/public/404" unless current_user_order?
  end
end
