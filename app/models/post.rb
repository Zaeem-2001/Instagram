class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  has_many :comments , dependent: :destroy
  has_many :likes , dependent: :destroy
  delegate :full_name, :username, to: :user
end
