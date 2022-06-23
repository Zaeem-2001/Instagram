# frozen_string_literal: true

module ApplicationHelper
  def time_ago(resource)
    time_ago_in_words(resource.created_at)
  end
end
