class AddQuantityToOrderedItems < ActiveRecord::Migration[5.0]
  def change
    add_column :ordered_items, :quantity, :integer, default: 1
  end
end
