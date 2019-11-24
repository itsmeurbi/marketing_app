# frozen_string_literal: true

class AddContentStatusInPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content_status, :integer
  end
end
