class User < ApplicationRecord
  validates :name, :furigana, :gender, :tell, :email, :post_number, :prefecture, :city, :town, :street_address, :birthday, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 50 }

  validates :email, :tell, uniqueness: true

  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, "では未来の日付を設定できません")if value > Date.today
  end

  # 電話番号の最長が11桁で間にハイフンが入っているため、最長13桁
  validates :phone, :tell,length:{ maximum: 13 }

    
  enum :gender, male: "Male", female: "Female", other: "Others"
  end
