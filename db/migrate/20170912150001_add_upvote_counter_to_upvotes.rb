class AddUpvoteCounterToUpvotes < ActiveRecord::Migration[5.1]
  def change
    add_column :upvotes, :upvotes_count, :integer
  end
end
