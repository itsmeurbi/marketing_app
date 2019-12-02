# frozen_string_literal: true

class AddParticipantstoChatroom < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :first, :integer, null: false
    add_column :chatrooms, :second, :integer, null: false
  end
end
