class UserSkill < ApplicationRecord
  belongs_to :user
  has_many :skill
end
