class AddToggledUsersToConversations < ActiveRecord::Migration[5.0]
  def change
  	add_column :conversations, :toggled_users, :integer, :default => [], :array => true
  end
end
