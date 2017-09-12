class Upvote < ApplicationRecord
  belongs_to :upvotable, polymorphic: true
  belongs_to :user
end
