class Skill < ApplicationRecord
  has_many :users_skills, dependent: :destroy
  has_many :users, through: :users_skills
  validates :name, presence: { message: "名前は必須です" }
  validates :name, uniqueness: { message: "すでに登録されているスキル名です" }
end
