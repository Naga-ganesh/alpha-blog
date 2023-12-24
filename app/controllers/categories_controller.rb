class CategoriesController < ApplicationController
  before_action :require_admin, except: [:show, :index]
  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def create
    @category = Category.new(category_parms)
    if @category.save
      flash[:notice] = "Category has been saved successfully"
      redirect_to @category
    else
      render "new"
    end
  end

  private
  def category_parms
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:notice] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end