# frozen_string_literal: true

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'from_id', dependent: :destroy
  has_one :post
  belongs_to :campain
  before_save :define_node_color
  validates :label, presence: true

  private

  def define_node_color
    self.color = '#34dbeb'
  end
end
