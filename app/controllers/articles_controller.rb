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
    if !current_user.nil?
      @articles = Article.all.order('created_at DESC')
    else
      redirect_to '/login'
    end
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

      redirect_to root_path
    else
      flash[:error] = 'Please select atleast one category.'
      render :new
    end
  end

  def show
    if !current_user.nil?
      @article = Article.find(params[:id])
      @author = User.where(id: @article.user_id).first
      @vote_count = Vote.where(article_id: @article.id).count
    else
      redirect_to '/login'
    end
  end

  def vote
    @article = Article.all.find(params[:id])
    Vote.create(user_id: current_user.id, article_id: @article.id)
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
