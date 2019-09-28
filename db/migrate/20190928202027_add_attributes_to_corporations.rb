# frozen_string_literal: true

class AddAttributesToCorporations < ActiveRecord::Migration[6.0]
  def change
    add_column :corporations, :legal_representant_name, :string, null: false
    add_column :corporations, :legal_representant_email, :string, null: false
    add_column :corporations, :legal_representant_phone, :string, null: false
    add_column :corporations, :legal_representant_role, :string, null: false
  end
end
