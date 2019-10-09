# frozen_string_literal: true

class ChangeCampainTypeAttribute < ActiveRecord::Migration[6.0]
  def up
    change_column :campains, :campain_type, :string
  end
end
