# frozen_string_literal: true

class CreateLogger < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :user_email
      t.string :action
      t.integer :resource
      t.integer :controller

      t.timestamps
    end
  end
end
