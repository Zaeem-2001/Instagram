class PostsController < ApplicationController

  def index
    @user=current_user
    @posts=@user.posts.all
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
    @user = current_user
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(posts_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to @post
    else
      redirect_to @post
      flash[:notice] = "Something went wrong"
    end
  end

  private

  def posts_params
    params.require(:post).permit(:caption)
  end

end
