# frozen_string_literal: true

module HomeHelper
  def following
    current_user.followees.select(:id)
  end
end
