class Article < ApplicationRecord
  belongs_to :user
  has_many :upvotes, :as => :upvotable
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  def voted_for?(article)
    article.upvotes.where(user: self).any?
  end

  def vote_for article
    article.upvotes.where(user: self).first
  end

  #include UpvotableConcern
end
