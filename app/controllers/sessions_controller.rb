class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
