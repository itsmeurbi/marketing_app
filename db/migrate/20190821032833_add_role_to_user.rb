# frozen_string_literal: true

class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roles_mask, :integer
  end
end
