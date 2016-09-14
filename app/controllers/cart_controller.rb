class CartController < ApplicationController
  include ActionView::Helpers::TextHelper
    before_action :current_item, only: [:create, :destroy]

  def create
    @cart.add_item(@current_item.id)
    session[:cart] = @cart.contents
    redirect_back(fallback_location: items_path)
  end

  def show
    @items = Item.where(id: @cart.contents.keys)
  end

  def destroy
    @cart.contents.delete(params[:item_id])
    flash[:success] = "Successfully removed #{view_context.link_to(@current_item.title, item_path(@current_item))} from your cart."

    redirect_back(fallback_location: items_path)
  end

  private

  def current_item
    @current_item = Item.find(params[:item_id])
  end

end
