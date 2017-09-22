class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = policy_scope(Article)

    @new_articles = Article.where("created_at > ?",
      current_user.last_sign_in_at)

    @sorted_articles = Article.includes(:upvotes).order('upvotes_count DESC').offset(2)
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = current_user.articles.build(article_params)
    authorize @article
    if @article.save
      flash[:notice] = "Votre article a bien été ajouté"
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Votre article a bien été modifié"
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Votre article a bien été supprimé"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  def article_params
    params.require(:article).permit(:title, :description, :url, tag_ids: [])
  end
end
