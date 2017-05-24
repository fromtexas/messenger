class AddToggledToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :toggled, :boolean
  end
end
