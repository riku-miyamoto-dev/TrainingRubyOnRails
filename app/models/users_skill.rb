class UsersSkill < ApplicationRecord
  belongs_to :user
  has_many :skill
end
