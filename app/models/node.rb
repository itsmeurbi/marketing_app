# frozen_string_literal: true

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'from_id', dependent: :destroy
  validates :label, presence: true
  before_save :define_node_color

  private

  def define_node_color
    self.color = '#34dbeb'
  end
end
