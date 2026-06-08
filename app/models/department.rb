class Department < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness:{ message: "すでに登録されている部署名です"}
end
