class AddColumnToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :furigana, :string
    add_column :users, :gender, :string
    add_column :users, :tel, :string
    add_column :users, :phone, :string
    add_column :users, :email, :string
    add_column :users, :post_number, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :town, :string
    add_column :users, :street_address, :string
    add_column :users, :building, :string
    add_column :users, :birthday, :date
  end
end
