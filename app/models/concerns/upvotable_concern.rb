# module UpvotableConcern

#   extend ActiveSupport::Concern

#   included do
#     has_many :upvotes, :as => :upvotable, dependent: :destroy
#     has_many :upvotes
#   end

#   def voted_for?(upvotable)
#     upvotable.upvotes.where(user: self).any?
#   end

#   def vote_for upvotable
#     upvotable.upvotes.where(user: self).first
#   end
# end
