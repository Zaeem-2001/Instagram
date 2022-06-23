# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user , only: %i[show follow unfollow]
  def index
    @users = User.search(params[:query])
    respond_to :js
  end

  def show
    @posts = @user.posts.ordered_desc
  end

  def follow
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
