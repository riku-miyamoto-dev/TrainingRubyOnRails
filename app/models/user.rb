class User < ApplicationRecord
  validates :name, :furigana, :gender, :tell, :email, :post_number, :prefecture, :city, :town, :street_address, :birthday, presence: { message: "省略できません" }
  validates :name, length: { in: 2..50, too_short: "は%{count}文字から入力可能です", too_long: "は%{count}文字まで入力可能です"}

  validates :email, :tell, uniqueness: true

  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, "では未来の日付を設定できません")if value > Date.today
  end

  # 電話番号の最長が11桁で間にハイフンが入っているため、最長13桁
  validates :tell,length:{ in: 10..13 , too_short: "は%{count}文字から入力可能です", too_long: "は%{count}文字まで入力可能です"} 
  validates :phone, length:{ is: 13 }
    
  enum :gender, male: "male", female: "female", other: "others"
  end
