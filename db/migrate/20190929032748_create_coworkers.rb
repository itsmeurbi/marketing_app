# frozen_string_literal: true

class CreateCoworkers < ActiveRecord::Migration[6.0]
  def change
    create_table :coworkers do |t|
      t.belongs_to :user, null: false
      t.belongs_to :campain, null: false
      t.integer :role, null: false
      t.timestamps
    end
  end
end
