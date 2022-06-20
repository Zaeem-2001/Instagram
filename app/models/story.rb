class Story < ApplicationRecord
  validates :image, attached: true, content_type: ['image/png', 'image/jpeg']

  after_save :destroy_stories
  has_one_attached :image
  belongs_to :user

  scope :folowing_stories , -> (follower_id) { where(user_id: follower_id ) }

  private

  


  def destroy_stories
    DeleteStoriesJob.set(wait: 24.hours).perform_later(self.id)
  end
end
