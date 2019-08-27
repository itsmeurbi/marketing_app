# frozen_string_literal: true

class Corporation < ApplicationRecord
  validates :name, presence: true
end
