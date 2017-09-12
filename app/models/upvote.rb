class Upvote < ApplicationRecord
  belongs_to :upvotable, polymorphic: true, counter_cache: true
  belongs_to :user
  # belongs_to :article, polymorphic: true, counter_cache: true
end
