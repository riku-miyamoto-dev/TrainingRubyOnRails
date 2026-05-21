class CreateDepartments < ActiveRecord::Migration[8.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.timestamps
    end
    add_reference :users, :department, null: true, foreign_key: false
  end
end



# book -> 社員, author -> 部署