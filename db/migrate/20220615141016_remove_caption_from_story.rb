class RemoveCaptionFromStory < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :caption, :string
  end
end
