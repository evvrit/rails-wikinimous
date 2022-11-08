class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params)
    @article.save(article_params)
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.save(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
