class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :header_img, :string
    add_column :users, :user_img, :string
    add_column :users, :description, :string
  end
end
