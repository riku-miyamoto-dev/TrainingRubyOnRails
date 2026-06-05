class AddimgToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :image, :binary
    add_column :users, :image_extension, :string
  end
end
