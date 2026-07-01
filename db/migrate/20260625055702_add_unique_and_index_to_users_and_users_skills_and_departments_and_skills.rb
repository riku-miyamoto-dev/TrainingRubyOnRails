# frozen_string_literal: true

class AddUniqueAndIndexToUsersAndUsersSkillsAndDepartmentsAndSkills < ActiveRecord::Migration[8.1]
  def change
    add_index :users, :birthday
    add_index :users, :email, unique: true

    add_index :departments, :name, unique: true
    add_index :skills, :name, unique: true

    add_index :users_skills, %w[user_id skill_id], name: 'index_users_skills_on_user_id_and_skill_id', unique: true
    remove_index :users_skills, :user_id
  end
end
