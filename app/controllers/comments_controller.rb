class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build
    @post = @comment.post
    if @comment.save
      redirect_to @post
      else
        redirect_to @user
    end
  end

  def update
  end

  def delete
  end

  private
  def comments_params

  end
end
