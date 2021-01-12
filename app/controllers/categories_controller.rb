class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @most_voted = Article.get_most_votes
  end

  def new
    if !current_user.nil?
      @category = Category.new
      @categories = Category.all
    else
      flash[:notice] = 'Please login to continue'
      redirect_to '/login'
    end
  end

  def create
    @category = Category.create(category_params)
    @category.user_id = current_user.id
    @category.name = params[:category][:name].capitalize
    @cat = Category.category_exists(@category.name)
    if @cat.exists?
      render :new, notice: 'Category already exists'
    else
      @category.save
      redirect_to root_path
    end
  end

  def show
    if !current_user.nil?
      @category = Category.find(params[:id])
      @articles = @category.articles.order("updated_at DESC")
    else
      redirect_to '/login'
    end
  end

  def default_image
    image_tag("default.jpg", alt: "default image")
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'Deleted successfully'
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
