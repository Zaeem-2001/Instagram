
module HomeHelper
def following
  current_user.followees.select(:id)
end
end
