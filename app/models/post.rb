class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  has_many :comments

  delegate :full_name, :username, to: :user
end
