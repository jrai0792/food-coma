class ArticlesController < ApplicationController
  before_action :authorize

  def new
    @article = Article.new
    @categories = Category.all
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(article_params)
    
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

  private
  def category_ids
    params[:category_ids]
  end
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end
