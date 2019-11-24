# frozen_string_literal: true

class AddPublicationDateToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :publish_at, :datetime
    add_column :posts, :auto_publish, :boolean
  end
end
