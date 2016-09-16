class CreateOrderedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_items do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps null: false
    end
  end
end
