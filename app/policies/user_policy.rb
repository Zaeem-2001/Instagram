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
    @user.id == @creater_user.id
  end

  def destroy?
    @user.id == @creater_user.id
  end

  def show?
    @user.id == @creater_user.id || @creater_user.followees.where(user_id: @user.id)
  end
end
