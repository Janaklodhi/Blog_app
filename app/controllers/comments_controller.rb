class CommentsController < ApplicationController

    def create
        byebug
        @article = Article.find_by(params[:id])
        @comment = @article.comments.create(comments_params)
        redirect_to article_path(@article)
    end 

    private

    def comments_params
        params.require(:comment).permit(params[:commenter, :body, article_id])
    end

end
