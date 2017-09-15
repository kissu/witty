class AddTitleAndDescritionToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :title, :string
    add_column :contacts, :description, :string, limit: 140
  end
end
