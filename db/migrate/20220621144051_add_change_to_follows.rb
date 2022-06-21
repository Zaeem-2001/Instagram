class AddChangeToFollows < ActiveRecord::Migration[5.2]
  def change
    change_column :follows, :follower_id, :integer, null: false

  end
end
