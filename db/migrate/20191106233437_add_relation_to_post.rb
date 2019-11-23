# frozen_string_literal: true

class AddRelationToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :coworker, foreign_key: true
  end
end
