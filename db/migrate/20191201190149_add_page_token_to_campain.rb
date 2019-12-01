# frozen_string_literal: true

class AddPageTokenToCampain < ActiveRecord::Migration[6.0]
  def change
    add_column :campains, :encrypted_page_token, :string
  end
end
