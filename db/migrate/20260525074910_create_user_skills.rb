class CreateUserSkills < ActiveRecord::Migration[8.1]
  def change
    create_table :user_skills do |t|
      t.belongs_to :users, null: false, foreign_key: true
      t.belongs_to :skills, null: false, foreign_key: true
      t.timestamps
    end
  end
end
