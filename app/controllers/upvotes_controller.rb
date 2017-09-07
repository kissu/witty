class UpvotesController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    @article.upvotes.create! user: current_user
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
