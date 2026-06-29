# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :department
  has_many :users_skills, dependent: :destroy
  has_many :skills, through: :users_skills

  has_secure_password

  PREFECTURES = %w[
    北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県
    新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県 三重県 滋賀県 京都府 大阪府 兵庫県
    奈良県 和歌山県 鳥取県 島根県 岡山県 広島県 山口県 徳島県 香川県 愛媛県 高知県 福岡県 佐賀県 長崎県
    熊本県 大分県 宮崎県 鹿児島県 沖縄県
  ].freeze

  # 存在チェック ＆ 文字数制限
  validates :name, presence: { message: '省略できません' }, length: { maximum: 30 }

  # その他の必須項目
  validates :furigana, :gender, :tel, :email, :post_number, :prefecture,
            :city, :town, :street_address, :birthday,
            presence: { message: '省略できません' }

  # 一意性チェック（フォーマット含む）
  validates :email, uniqueness: { message: 'すでに使われているメールアドレスです' }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :tel, uniqueness: { message: 'すでに使われている携帯番号です' }

  # 各種正規表現チェック
  validates :furigana, format: { with: /\A[ァ-ヶー\s ]+\z/, message: '全角カタカナ、半角スペース、全角スペースのみが使えます' }
  validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'は３桁-４桁の形でお願いします' }
  validates :phone, format: { with: /\A\d{3}-\d{4}-\d{4}\z/, message: 'は３桁-４桁-４桁の形でお願いします' }, allow_nil: true
  validates :tel, format: {
    with: /\A0([6789]0-\d{4}|\d{1}-\d{4}|\d{2}-\d{3}|\d{3}-\d{2}|\d{4}-\d{1})-\d{4}\z/,
    message: 'は2桁-４桁-４桁 or 4桁-2桁-４桁 or 3桁-3桁-４桁 or 3桁-2桁-４桁の形でお願いします'
  }

  # 未来の日時不可
  validates_each :birthday do |record, attr, value|
    if value && value > Date.today
      record.errors.add(attr, 'では未来の日付を設定できません')
    end
  end

  enum :gender, { male: '男', female: '女', other: 'その他' }, validate: true
  enum :prefecture, PREFECTURES.index_with(&:to_s), validate: true

  scope :id_sort_ascending_order, -> { order(id: :asc) }
  scope :id_sort_descending_order, -> { order(id: :desc) }

end
