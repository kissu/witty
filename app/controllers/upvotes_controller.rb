class UpvotesController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    upvote = @article.upvotes.new user: current_user
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

  def set_article
    @article = Article.find(params[:article_id])
  end
end
