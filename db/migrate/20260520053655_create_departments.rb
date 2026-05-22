class CreateDepartments < ActiveRecord::Migration[8.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_reference :users, :department, null: false, foreign_key: false
  end
end
