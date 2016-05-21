class CommentsController < ApplicationController

  def create
    comment = current_user.comments.new(create_permitted_params)

    if comment.save
      flash[:notice] = "Comment Saved Successfully"
    else
      flash[:error] = "Comment Creation Failed."
    end
    redirect_to news_feeds_path(anchor: params[:anchor_value])
  end

  private
    def create_permitted_params
      params.permit(:commentable_id, :commentable_type, :title)
    end
end
