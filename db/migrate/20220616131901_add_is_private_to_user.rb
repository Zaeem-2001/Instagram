class AddIsPrivateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isPrivate, :integer , :default => 0 , :null => false
  end
end
