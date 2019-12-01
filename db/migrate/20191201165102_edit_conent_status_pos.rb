# frozen_string_literal: true

class EditConentStatusPos < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :content_status, :integer, default: 0
  end
end
