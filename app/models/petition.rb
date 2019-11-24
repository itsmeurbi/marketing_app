# frozen_string_literal: true

class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :responsable, class_name: 'Coworker', foreign_key: 'coworker_id'
  belongs_to :post
  enum status: %i[active pending approved]
  validates :message, presence: true
  validates :status, presence: true

  scope :coworker_petitions, ->(coworker) { where(responsable: coworker) }
end
