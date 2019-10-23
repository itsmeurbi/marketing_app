# frozen_string_literal: true

class CreatePost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.belongs_to :node
      t.belongs_to :user

      t.timestamps
    end
  end
end
