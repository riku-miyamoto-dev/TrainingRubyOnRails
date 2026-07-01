# frozen_string_literal: true

class AddimgToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :image, :binary, limit: 50.megabytes
    add_column :users, :image_extension, :string
  end
end
