class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.valid?
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # hacerlo genérico!
  def send_last_ten
    LastArticlesWorker.perform_async(current_user.id)
    render status: 200, nothing: true, message: 'todo ok'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
