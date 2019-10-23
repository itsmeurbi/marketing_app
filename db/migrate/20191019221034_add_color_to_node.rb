# frozen_string_literal: true

class AddColorToNode < ActiveRecord::Migration[6.0]
  def change
    add_column :nodes, :color, :string
  end
end
