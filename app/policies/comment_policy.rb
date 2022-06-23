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
    own_comment? || @user == @comment.post.user
  end
  def edit?
    own_comment?
  end

  private
  def own_comment?
    @user.id == @comment.user_id
  end
end
