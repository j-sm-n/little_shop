class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_slug(params[:category_name])
    @items = @category.items.order(title: :asc)
  end
end
