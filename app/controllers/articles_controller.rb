class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def new
    @article = Article.new
  end
  
  def index
    @articles = Article.all
  end
  
  def destroy
    @article.destroy
    
    redirect_to articles_path
    flash[:notice] = "Article was successfully deleted"
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end
  
  def create
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show

  end
end

private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
  