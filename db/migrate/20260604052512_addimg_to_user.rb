class AddimgToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :user_img, :binary
    add_column :users, :user_img_extension, :string
  end
end
