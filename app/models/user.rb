class User < ApplicationRecord
  validates :name, :furigana, :gender, :tell, :email, :post_number, :prefecture, :city, :town, :street_address, :birthday, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 50 }
  end
