class CreateArticlesTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :articles, :tags
  end
end
