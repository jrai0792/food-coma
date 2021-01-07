class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end


  def new
    if !current_user.nil?
      @category = Category.new
      @categories = Category.all
    else
      flash[:notice] = "Please login to continue"
      redirect_to '/login'
    end
  end

  def create
    @category = Category.create(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:success] = "Created success"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong, please check"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Deleted successfully"
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
