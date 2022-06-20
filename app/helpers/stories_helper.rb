# frozen_string_literal: true

module StoriesHelper
  def next_story(current_story)
    Story.folowing_stories(following).where('id > ?', current_story).first
  end

  def prev_story(current_story)
    Story.folowing_stories(following).where('id < ?', current_story).last
  end

  def next_story?(current_story)
    Story.folowing_stories(following).where('id > ?', current_story).present?
  end

  def prev_story?(current_story)
    Story.folowing_stories(following).where('id < ?', current_story).present?
  end
end
