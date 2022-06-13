class StoriesController < ApplicationController
  def index
  end

  def new
    @story = current_user.stories.build
  end

  def show
    @story = Story.find(params[:id])
    render :layout => false
  end

  def create
    @story = current_user.stories.build(stories_params)
    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    if @story.destroy
      redirect_to @story
    else
      redirect_to @story
      flash[:notice] = "Something went wrong"
    end
  end

  private
  def stories_params
    params.require(:story).permit(:caption,:image)
  end

end
