# frozen_string_literal: true

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'from_id'
  validates :label, presence: true
end
