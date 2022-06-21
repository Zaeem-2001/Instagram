# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.includes(:user,:likes,:comments,{comments: :user}).find(params[:id])
    @comments = @post.comments.includes(:user).all.order('created_at DESC')
    authorize(@post.user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    authorize(@post.user)
    if @post.update(posts_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to @post
    else
      flash[:notice] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize(@post.user)
    if @post.destroy!
      redirect_to current_user
    else
      redirect_to @post
      flash[:notice] = 'Something went wrong'
    end
  end

  private

  def posts_params
    params.require(:post).permit(:caption, images: [])
  end
end
