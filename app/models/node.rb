# frozen_string_literal: true

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'node_from_id'
  validates :label, presence: true
end
