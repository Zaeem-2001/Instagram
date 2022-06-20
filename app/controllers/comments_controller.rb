# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[edit update create destroy]

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    authorize(@comment)
    if @comment.update(comments_params)
      flash[:alert] = 'Comment updated successfully'
      redirect_to @post
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    authorize(@comment)
    redirect_to @post if @comment.destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: @post.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
