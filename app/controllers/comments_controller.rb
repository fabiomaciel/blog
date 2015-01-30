class CommentsController < ApplicationController
  def create
    @article = current_article
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = current
    @comment.destroy

    redirect_to article_path(current_article)
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body)
    end
    def current_article
      Article.find(params[:article_id])
    end
    def current
      Comment.find(params[:id])
    end
end
