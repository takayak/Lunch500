class CommentsController < ApplicationController

  def create
    # Comment.create(comment_params)
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to "/posts/#{@comment.post.id}"}
      format.json { render json: @comment}
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
