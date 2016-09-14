class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :gender
      t.string :user_image, default: 'https://s22.postimg.org/8r7f8ry81/user.png'
      t.timestamps 
    end
  end
end
