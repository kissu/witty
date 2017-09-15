class CreateContactsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :contacts, :tags
  end
end
