class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = policy_scope(Article)
    @articles = Article.all
    @array_sorted_articles = []

    @articles.each do |article|
      @array_sorted_articles << [ article.id, article.upvotes.size,
        article.title, article.description, article.url, article.tags.first.name ]
    end

    # on trie les articles en ordre decroissant
    @array_sorted_articles.sort_by!{ |article,vote| vote }.reverse!
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
