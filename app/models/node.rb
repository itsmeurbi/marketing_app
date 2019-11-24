# frozen_string_literal: true

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'from_id', dependent: :destroy
  has_one :post
  belongs_to :campain
  validates :label, presence: true
end
