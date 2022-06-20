# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    @user.id == @comment.user_id || @user == @comment.post.user
  end
end
