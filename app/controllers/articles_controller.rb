class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
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
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash.now[:notice] = "Article was created Successfully"
      redirect_to @article
    else
      flash[:notice] = "Article was not created Successfully"
      render 'new'
    end
  end

  def edit
  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article has been updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
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
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
end
