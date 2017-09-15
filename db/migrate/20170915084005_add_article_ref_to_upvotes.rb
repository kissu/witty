class AddArticleRefToUpvotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :upvotes, :article, foreign_key: true
  end
end
