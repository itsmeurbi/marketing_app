# frozen_string_literal: true

class Campain < ApplicationRecord
  validates :name, presence: true
end
