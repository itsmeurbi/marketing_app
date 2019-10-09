# frozen_string_literal: true

class AddCompanyToCampaign < ActiveRecord::Migration[6.0]
  def change
    add_column :campains, :company_id, :integer
    add_column :campains, :company_type, :string
  end
end
