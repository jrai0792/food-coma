class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end


  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
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
