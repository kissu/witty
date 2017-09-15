class RemoveFieldsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :company, :string
    remove_column :users, :title, :string
    remove_column :users, :description, :string
  end
end
