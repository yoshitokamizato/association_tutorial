class CommentsController < ApplicationController
  def create
    comment = Comment.new(user_id: current_user.id, tweet_id: params[:tweet_id], body: comment_params[:body])
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    Comment.destroy(id: params[:id])
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
