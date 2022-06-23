# frozen_string_literal: true

module UsersHelper
  def show?(user)
    user.publicAccount? || current_user.followees.exists?(user.id) || user == current_user
  end

  def own_account(user)
    user.id == current_user.id
  end

  def is_follower?(user)
    current_user.followees.include?(user)
  end
end
