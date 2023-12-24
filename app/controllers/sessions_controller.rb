class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to articles_path
    else
      flash[:alert] = "Failed to logged in"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end
end
