module Admin
  class ItemsController < Admin::BaseController
    def index
      @items = Item.all
    end

    def edit
      @item = current_item
    end

    def update
      item = current_item
      item.update(items_params)
      redirect_to item_path(item)
    end

    private

    def current_item
      Item.find(params[:id])
    end

    def items_params
      params.require(:item).permit(:title, :description, :price, :image_path, :long_description)
    end
  end
end
