class Story < ApplicationRecord
  after_save :destroy_stories
  has_one_attached :image
  belongs_to :user

  private
  def destroy_stories
    DeleteStoriesJob.set(wait: 24.seconds).perform_later(self.id)
  end
end
