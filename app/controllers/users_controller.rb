class UsersController < ApplicationController

  def index
    @users = User.search(params[:query])
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    @posts=@user.posts.all
  end

  def follow
    @user = User.find(params[:id])
  current_user.followees << @user
  redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

end
