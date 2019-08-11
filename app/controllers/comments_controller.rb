class CommentsController < ApplicationController
  def create
    Comment.create(user_id: current_user.id, tweet_id: params[:tweet_id], body: params[:body])
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    Comment.destroy(id: params[:id])
    redirect_to tweet_path(params[:tweet_id])
  end
end
