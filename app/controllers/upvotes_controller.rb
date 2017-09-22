class UpvotesController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    upvote = @article.upvotes.new user: current_user
    authorize upvote
    upvote.save
    respond_to do |format|
      format.html { redirect_to articles_path }
      format.js
    end
  end

  def destroy
    upvote = Upvote.find(params[:id])
    authorize upvote
    @article = upvote.article
    upvote.destroy
    respond_to do |format|
      format.html { redirect_to articles_path }
      format.js
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
