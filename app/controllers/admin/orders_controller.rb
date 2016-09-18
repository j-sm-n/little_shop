module Admin
  class OrdersController < Admin::BaseController
    def index
      @orders = Order.where(status: params[:status])
    end

    def update
      order = Order.find(params[:order_id])
      order.change_status(params[:status])
      redirect_back(fallback_location: login_path)
    end
  end
end
