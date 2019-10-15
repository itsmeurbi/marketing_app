# frozen_string_literal: true

class Edge < ApplicationRecord
  belongs_to :node_from, class_name: 'Node', foreign_key: 'node_from_id'
  belongs_to :node_to, class_name: 'Node', foreign_key: 'node_to_id'
end
