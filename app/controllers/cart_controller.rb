class CartController < ApplicationController
  include ActionView::Helpers::TextHelper


  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_back(fallback_location: items_path)
  end

  def show
    @items = Item.where(id: @cart.contents.keys)
  end

  def destroy
    current_item = Item.find(params[:item_id])
    @cart.contents.delete(params[:item_id])
    flash.now[:sucess] = "Successfully removed #{current_item.title} from your cart."
    redirect_back(fallback_location: items_path)
  end

end
