class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = policy_scope(Article)

    # order_articles = []
    # @articles.each do |article|
    #   order_articles << article
    # end
    sorted_indexed_array_most_upvoted_first = []
    @articles = Article.all

    # @articles.each_with_index do |article, index|
    #   sorted_indexed_array_most_upvoted_first[0] = index
    #   sorted_indexed_array_most_upvoted_first[1] = article.upvotes.size
    # end
    # p sorted_array_most_upvoted_first.sort.reverse


    # arr = [[0, Article.first.upvotes.size], [1, Article.second.upvotes.size]]
    arr = []
    @articles.each_with_index do |article, index|
      arr << [ article.id, article.upvotes.size ]
    end
    arr.sort_by(&:last)
    byebug
    arr.each_index do |x|
      puts "Article ##{arr[x][0]} has #{arr[x][1]} upvotes"
    end

    # @articles.sort { |a,b| a.created_at <=> b.created_at }
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
