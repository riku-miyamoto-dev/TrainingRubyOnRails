class AddColumnToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :furigana, :string, null: false
    add_column :users, :gender, :string, null: false
    add_column :users, :tel, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :email, :string, null: false
    add_column :users, :post_number, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :town, :string, null: false
    add_column :users, :street_address, :string, null: false
    add_column :users, :building, :string
    add_column :users, :birthday, :date, null: false
  end
end
