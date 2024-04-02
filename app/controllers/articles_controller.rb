class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show edit update destroy]
    def index
        @articles = Article.all
    end

    def show
        
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article, notice: "create success!"
        else
            flash.now[:alert] = "false..."
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to @article, notice: "update success!"
        else
            flash.now[:alert] = "false..."
            render :edit
        end
    end

    def destroy
        @article.delete
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :content)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
