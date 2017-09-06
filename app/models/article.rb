class Article < ApplicationRecord
  belongs_to :user
  has_many :upvotes, :as => :upvotable
  has_many :article_tags
  has_many :tags, through: :article_tags
end
