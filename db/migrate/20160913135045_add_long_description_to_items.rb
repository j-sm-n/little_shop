class AddLongDescriptionToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :long_description, :text
  end
end
