class ArticlesController < ApplicationController
  before_action :check_user, only: %i[new edit]
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @categories = Category.all
    @articles = Article.all.order(created_at: :desc)
    @current_category_id = params[:category_id]
  end

  def category
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @articles = @category.articles.order(created_at: :desc)
    @current_category_id = @category.id

    render :index
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to dashboard_path, notice: 'create success!'
    else
      flash.now[:alert] = 'false...'
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to dashboard_path, notice: 'update success!'
    else
      flash.now[:alert] = 'false...'
      render :edit
    end
  end

  def destroy
    @article.delete
    redirect_to dashboard_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :cover_photo, category_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
