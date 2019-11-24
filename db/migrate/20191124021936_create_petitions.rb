# frozen_string_literal: true

class CreatePetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :petitions do |t|
      t.text :message
      t.text :content
      t.integer :status
      t.references :user
      t.references :coworker
      t.references :post

      t.timestamps
    end
  end
end
