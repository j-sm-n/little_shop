class CartController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to :back
  end

  def show
    @items = Item.where(id: @cart.contents.keys)
  end
end
