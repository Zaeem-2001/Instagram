class AddSeconedChangeToFollows < ActiveRecord::Migration[5.2]
  def change
    change_column :follows, :followee_id, :integer, null: false
  end
end
