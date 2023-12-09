class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    if @article.title.length == 0
      @article.title = "No title"
    end
  end
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created Successfully"
      redirect_to @article
    else
      flash[:alert] = "#{@article.errors.full_messages}"
      render 'new'
    end
  end
end
