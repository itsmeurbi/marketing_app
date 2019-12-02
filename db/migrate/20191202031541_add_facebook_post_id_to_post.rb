# frozen_string_literal: true

class AddFacebookPostIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :facebook_id, :string
  end
end
