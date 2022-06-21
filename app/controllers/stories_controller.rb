# frozen_string_literal: true

class StoriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :destroy
  def new
    @story = current_user.stories.build
  end

  def show
    @story = Story.find(params[:id])
    render layout: false
  end

  def create
    @story = current_user.stories.build(stories_params)
    if @story.save
      redirect_to user_path(current_user)
    else
      redirect_to new_story_path
      flash[:errors] = @story.errors.full_messages
    end
  end

  def destroy
    @story = Story.find(params[:id])
    authorize(@story.user)
    if @story.destroy
      flash[:notice] = 'Story was successfully destroyed'
      redirect_to current_user
    else
      redirect_to @story
      flash[:notice] = 'Something went wrong'
    end
  end

  private

  def stories_params
    params.require(:story).permit(:image)
  end
end
