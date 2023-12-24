class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created. Welcome #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end


  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You are successfully updated your user account"
      redirect_to articles_path
    else
      render "edit"
    end

  end

  def show
    @articles = @user.articles
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "User and the association articles has been deleted"
    redirect_to articles_path
      
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
