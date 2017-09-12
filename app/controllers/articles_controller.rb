class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @articles = Article.all
    @articles = policy_scope(Article)

    @array_sorted_articles = []
    @new_articles = []
    @articles.each do |article|
      # test below : last user connection >= 1 day of the last article posted ?
      # if (current_user.last_sign_in_at - article.created_at > 86400)
      #   @new_articles << { id: article.id,
      #                      upvotes: article.upvotes.size,
      #                      title: article.title,
      #                      description: article.description,
      #                      url: article.url,
      #                      tags: article.tags }
      # else
      #   @array_sorted_articles << { id: article.id,
      #                               upvotes: article.upvotes.size,
      #                               title: article.title,
      #                               description: article.description,
      #                               url: article.url,
      #                               tags: article.tags }
      # end
    end
    @array_sorted_articles.sort_by!{ |k,v| k[:upvotes] }.reverse!
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
