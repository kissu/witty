class RemoveUpvotableFromUpvotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :upvotes, :upvotable_type, :string
    remove_column :upvotes, :upvotable_id, :bigint
  end
end
