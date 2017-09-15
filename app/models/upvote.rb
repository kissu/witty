class Upvote < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user
end
