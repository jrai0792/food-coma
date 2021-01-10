class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'User created successfully'
      redirect_to '/'
    else
      flash.now[:danger] = 'Something went wrong, please check the errors'
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
