class LikesController < ApplicationController
  before_action :find_post
  before_action :already_liked?
  def create
    @post.likes.create!(user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like=@post.likes.find(params[:id])
    @like.destroy!
    redirect_back(fallback_location: root_path)
  end
  private

  def find_post
    @post= Post.find( params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id , post_id: Post.find(params[:post_id])).exists?
  end


end
