class UpvotesController < ApplicationController
  before_action :set_upvote, only: [:create]

  def create
    @article.upvotes.create! user: current_user
    redirect_to articles_path
  end

  private

  def set_upvote
    @article = Article.find(params[:id])
  end
end
