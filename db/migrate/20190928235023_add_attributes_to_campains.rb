# frozen_string_literal: true

class AddAttributesToCampains < ActiveRecord::Migration[6.0]
  def change
    add_column :campains, :start_date, :date, null: false
    add_column :campains, :end_date, :date, null: false
    add_column :campains, :objective, :string
    add_column :campains, :campain_type, :integer, null: false
    add_column :campains, :product, :string
    add_reference :campains, :manager, foreign_key: { to_table: :users }
  end
end
