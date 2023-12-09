class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    if @article.title.length == 0
      @article.title = "No title"
    end
  end
end
