# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.belongs_to :corporation

      t.timestamps
    end
  end
end
