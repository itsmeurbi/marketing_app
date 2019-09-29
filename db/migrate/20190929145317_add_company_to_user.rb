# frozen_string_literal: true

class AddCompanyToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :company, index: true
  end
end
