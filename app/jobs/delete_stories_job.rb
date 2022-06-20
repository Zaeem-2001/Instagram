# frozen_string_literal: true

class DeleteStoriesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Story.find_by(id: args[0])&.destroy
  end
end
