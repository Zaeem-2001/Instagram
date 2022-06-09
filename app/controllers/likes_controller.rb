class LikesController < ApplicationController
  before_action :find_post
  before_action :already_liked?
  def create
    if already_liked?
      flash[:notice] ="you can like more than one"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] ="cannot unlike"
    else
      @like=@post.likes.find(params[:id])
      @like.destroy
    end
    redirect_to post_path(@post)


  end
  private

  def find_post
    @post= Post.find( params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id , post_id: Post.find(params[:post_id])).exists?
  end


end
