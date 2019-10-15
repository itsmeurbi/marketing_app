# frozen_string_literal: true

class Campain < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :coworkers
  has_many :nodes
  has_many :edges, through: :nodes
  has_one_attached :image
  belongs_to :company, polymorphic: true

  validates :name,
            :start_date,
            :end_date,
            :objective,
            :campain_type,
            :product,
            :image,
            presence: true
  validates :name, :objective, :campain_type, :product, length: { in: 5..30 }
end
