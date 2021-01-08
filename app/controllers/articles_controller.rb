class ArticlesController < ApplicationController

  def new
    if !current_user.nil?
    @article = Article.new
    @categories = Category.all
    else
      redirect_to '/login'
    end
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(article_params)
    @article.user_id = current_user.id
    if !category_ids.nil? 
      category_ids.each do |category|
        @article.categories << Category.find_by_id(category)
      end
      @article.save
      @article.image = params[:image]
      
      redirect_to articles_path
    else
      flash[:error] ="Please select atleast one category."
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @author = User.where(:id => @article.user_id).first
  end

  def vote
    @article = Article.all.find(params[:id])
    Vote.create(user_id: current_user.id, article_id:@article.id)
    redirect_to article_path(@article)
  end

  private
  def category_ids
    params[:category_ids]
  end
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end
