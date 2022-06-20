module LikesHelper
  def prelike
    post.likes.find {|like| like.user_id == current_user.id }
  end
end
