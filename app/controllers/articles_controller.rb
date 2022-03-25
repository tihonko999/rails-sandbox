class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @article.save
    render :show
  end

  def update
    @article.update(article_params)
    render :show
  end

  def destroy
    @article.destroy
    render :show
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end