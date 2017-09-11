class UpvotesController < ApplicationController
  before_action :set_upvotable, only: [:create]

  def create
    upvote = @upvotable.upvotes.new user: current_user
    authorize upvote
    upvote.save
    redirect_to articles_path
  end

  def destroy
    upvote = Upvote.find(params[:id])
    authorize upvote
    upvote.destroy
    redirect_to articles_path
  end

  private

  def set_upvotable
    @upvotable = params[:upvotable_type].constantize.find(params[:upvotable_id])
  end
end
