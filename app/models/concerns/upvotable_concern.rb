module UpvotableConcern

  extend ActiveSupport::Concern


  def voted_for?(upvotable)
    upvotable.upvotes.where(user: self).any?
  end

  def vote_for upvotable
    upvotable.upvotes.where(user: self).first
  end
end
