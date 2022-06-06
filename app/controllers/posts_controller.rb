class PostsController < ApplicationController

  def index
    @posts=Post.all
  end

  def new
    @post = current_user.posts.build
  end


  def create

    @post = current_user.posts.build(posts_params)
    # @post.images.attach(params[:images])

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
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
    params.require(:post).permit(:caption,images: [])
  end

end
