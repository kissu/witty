class Article < ApplicationRecord
  belongs_to :user
  has_many :upvotes
  has_and_belongs_to_many :tags

  include UpvotableConcern
end
