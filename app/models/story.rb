# frozen_string_literal: true

class Story < ApplicationRecord
  validates :image, attached: true, content_type: ['image/png', 'image/jpeg']

  after_save :destroy_stories
  has_one_attached :image
  belongs_to :user

  scope :folowing_stories, ->(follower_id) { where(user_id: follower_id).order('created_at ASC') }

  private

  def destroy_stories
    DeleteStoriesJob.set(wait: 24.hours).perform_later(id)
  end
end
