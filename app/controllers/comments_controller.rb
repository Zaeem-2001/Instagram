class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)
    @comment.post_id=params[:post_id]
    if @comment.save
       redirect_to current_user
      else
        flash[:alert] = "Something went wrong"
    end
  end

  def update

  end

  def destroy
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.find(params[:id])
    # byebug
    # @comment.destroy
    # # redirect_to post_path(@post)
  end

  private
  def comments_params
    params.require(:comment).permit(:body ,:post_id)
  end
end
