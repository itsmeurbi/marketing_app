# frozen_string_literal: true

class CreateNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
      t.belongs_to :campain, null: false
      t.belongs_to :node, as: :reference
      t.string :label, null: false

      t.timestamps
    end
  end
end
