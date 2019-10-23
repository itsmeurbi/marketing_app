# frozen_string_literal: true

class Edge < ApplicationRecord
  belongs_to :from, class_name: 'Node', foreign_key: 'from_id'
  belongs_to :to, class_name: 'Node', foreign_key: 'to_id'
end
