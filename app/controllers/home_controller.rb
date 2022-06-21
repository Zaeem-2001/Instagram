# frozen_string_literal: true

class HomeController < ApplicationController
  include HomeHelper
  def index
    @story=Story.folowing_stories(following)
    @posts=Post.following_posts(following)
  end

end
