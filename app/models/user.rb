class User < ApplicationRecord
  validates :name, :furigana, :gender, :tel, :email, :post_number, :prefecture, :city, :town, :street_address, :birthday, presence: { message: "省略できません" }
  validates :name, length: { in: 2..50, too_short: "は%{count}文字から入力可能です", too_long: "は%{count}文字まで入力可能です"}

  validates :email, :tel, uniqueness: true


  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, "では未来の日付を設定できません")if value > Date.today
  end

  validates :furigana, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :post_number, format: {with:/\A\d{3}[-]\d{4}\z/}

  # 電話番号の最長が11桁で間にハイフンが入っているため、最長13桁
  validates :tel,length:{ in: 10..13 , too_short: "は%{count}文字から入力可能です", too_long: "は%{count}文字まで入力可能です"} 
  validates :phone, format: {with:/\A\d{3}[-]\d{4}[-]\d{4}\z/}
  validates :tel, format: {with:/\A\d{2}[-]\d{4}[-]\d{4}|\d{4}[-]\d{2}[-]\d{4}|\d{3}[-]\d{3}[-]\d{4}|\d{3}[-]\d{2}[-]\d{4}\z/}

  enum :gender, {male: "male", female: "female", other: "others"}, validate: true
  enum :prefecture, {
    北海道: "北海道",
    青森県: "青森県",
    岩手県: "岩手県",
    宮城県: "宮城県",
    秋田県: "秋田県",
    山形県: "山形県",
    福島県: "福島県",
    茨城県: "茨城県",
    栃木県: "栃木県",
    群馬県: "群馬県",
    埼玉県: "埼玉県",
    千葉県: "千葉県",
    東京都: "東京都",
    神奈川県: "神奈川県",
    新潟県: "新潟県",
    富山県: "富山県",
    石川県: "石川県",
    福井県: "福井県",
    山梨県: "山梨県",
    長野県: "長野県",
    岐阜県: "岐阜県",
    静岡県: "静岡県",
    愛知県: "愛知県",
    三重県: "三重県",
    滋賀県: "滋賀県",
    京都府: "京都府",
    大阪府: "大阪府",
    兵庫県: "兵庫県",
    奈良県: "奈良県",
    和歌山県: "和歌山県",
    鳥取県: "鳥取県",
    島根県: "島根県",
    岡山県: "岡山県",
    広島県: "広島県",
    山口県: "山口県",
    徳島県: "徳島県",
    香川県: "香川県",
    愛媛県: "愛媛県",
    高知県: "高知県",
    福岡県: "福岡県",
    佐賀県: "佐賀県",
    長崎県: "長崎県",
    熊本県: "熊本県",
    大分県: "大分県",
    宮崎県: "宮崎県",
    鹿児島県: "鹿児島県",
    沖縄県: "沖縄県"
}, validate: true

  end
