class CartController < ApplicationController
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
    @cart.contents.delete(params[:item_id])
    redirect_back(fallback_location: items_path)
    # flash[:sucess] = "Successfully removed #{view_context.link_to(@item.title, item_path(@item))} from your cart."
  end

end
