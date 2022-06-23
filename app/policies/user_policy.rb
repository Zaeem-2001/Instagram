# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def initialize(user, creater_user)
    @user = user
    @creater_user = creater_user
  end

  def update?
    own_post?
  end

  def destroy?
    own_post?
  end

  def edit?
    own_post?
  end

  def show?
    own_post? || @creater_user.followees.where(user_id: @user.id)
  end

  private
  def own_post?
    @user.id == @creater_user.id
  end
end
