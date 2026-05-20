class CreateDepartments < ActiveRecord::Migration[8.1]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.timestamps
    end
    add_reference :users, :department, null: true, foreign_key: true
  end
end



# book -> 社員, author -> 部署