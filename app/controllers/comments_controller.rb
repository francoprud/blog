class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.create(comment_params)
    if @comment.valid?
      redirect_to article_path(@article)
    else
      # No se pudo crear el comentario
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
