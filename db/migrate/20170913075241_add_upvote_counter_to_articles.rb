class AddUpvoteCounterToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :upvotes_count, :integer, default: 0
  end
end
