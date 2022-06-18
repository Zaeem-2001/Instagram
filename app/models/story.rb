class Story < ApplicationRecord
  after_save :destroy_stories
  has_one_attached :image
  belongs_to :user

  scope :folowing_stories , -> (follower_id) { where(user_id: follower_id ) }

  private

  scope :next_story, ->(current_story) { where("id > ?", current_story).first }

  scope :next_story?, ->(current_story) { where("id > ?", current_story).present? }

  scope :prev_story?, ->(current_story) { where("id < ?", current_story).present? }


  def destroy_stories
    DeleteStoriesJob.set(wait: 24.hours).perform_later(self.id)
  end
end
