class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, foreign_key: true
      t.timestamps null: true
    end
  end
end
