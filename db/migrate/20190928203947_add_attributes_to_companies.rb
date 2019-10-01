# frozen_string_literal: true

class AddAttributesToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :legal_representant_name, :string, null: false
    add_column :companies, :legal_representant_email, :string, null: false
    add_column :companies, :legal_representant_phone, :string, null: false
    add_column :companies, :legal_representant_role, :string, null: false
    add_column :companies, :bussines_name, :string, null: false
    add_column :companies, :rfc, :string, null: false
    add_column :companies, :location, :string, null: false
  end
end
