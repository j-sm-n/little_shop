module Admin
  class OrdersController < Admin::BaseController
    def index
      @orders = Order.where(status: params[:status])
    end
  end
end
