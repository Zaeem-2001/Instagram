class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Something went wrong"
    end
  end

  def update

  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
    redirect_to @post
    end

  end

  private
  def comments_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: @post.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
