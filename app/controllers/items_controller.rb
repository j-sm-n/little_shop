class ItemsController < ApplicationController
  def index
    @items = Item.all.order(title: :asc)
  end

  def show
    @item = Item.find(params[:id])
  end

end
