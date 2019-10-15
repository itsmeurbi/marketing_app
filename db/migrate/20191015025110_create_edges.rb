# frozen_string_literal: true

class CreateEdges < ActiveRecord::Migration[6.0]
  def change
    create_table :edges do |t|
      t.belongs_to :node_from
      t.belongs_to :node_to

      t.timestamps
    end
  end
end
