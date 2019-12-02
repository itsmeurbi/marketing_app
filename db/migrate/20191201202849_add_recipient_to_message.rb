class AddRecipientToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :recipient_id, :integer, null: false
  end
end
