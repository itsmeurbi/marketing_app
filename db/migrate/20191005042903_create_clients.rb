# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.belongs_to :user
      t.belongs_to :corporation

      t.timestamps
    end
  end
end
