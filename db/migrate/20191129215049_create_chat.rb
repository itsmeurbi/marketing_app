# frozen_string_literal: true

class CreateChat < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name, null: false

      t.timestamps
    end
    create_table :messages do |t|
      t.text :content, null: false
      t.belongs_to :user
      t.belongs_to :chatroom
      t.timestamps
    end
  end
end
