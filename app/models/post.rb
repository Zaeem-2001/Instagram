class Post < ApplicationRecord
  validates :images, attached: true, content_type:  ['image/png', 'image/jpeg']
  validates :images, limit: { min: 1, max: 10 }
  belongs_to :user
  has_many_attached :images

  has_many :comments , dependent: :destroy
  has_many :likes , dependent: :destroy
  delegate :full_name, :username, to: :user
end
