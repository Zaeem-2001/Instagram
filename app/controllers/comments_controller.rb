# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[new edit update create destroy]
  before_action :set_comment, only: %i[edit update destroy]
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to post_path(@post)
      flash[:error] = @comment.errors.full_messages
    end
  end

  def edit
    authorize(@comment.user)
  end

  def update
    authorize(@comment.user)
    if @comment.update(comments_params)
      flash[:alert] = 'Comment updated successfully'
      redirect_to post_path(@post)
    else
      redirect_to edit_post_comment_path(@post,@comment)
      flash[:error] = @comment.errors.full_messages
    end
  end

  def destroy
    authorize(@comment.user)
    if @comment.destroy
      redirect_to @post
    else
      redirect_to @post
      flash[:error] = @comment.errors.full_messages
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: @post.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
