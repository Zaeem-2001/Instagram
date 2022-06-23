# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.includes(:user,:likes,:comments,{comments: :user}).find(params[:id])
    @comments = @post.comments.includes(:user).ordered_desc
    authorize(@post.user)
  end

  def edit
    authorize(@post.user)
  end

  def update
    authorize(@post.user)
    if @post.update(posts_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def destroy
    authorize(@post.user)
    if @post.destroy

      redirect_to current_user
    else
      redirect_to @post
      flash[:error] = @post.errors.full_messages
    end
  end

  private

  def posts_params
    params.require(:post).permit(:caption, images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
