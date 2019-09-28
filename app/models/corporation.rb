# frozen_string_literal: true

class Corporation < ApplicationRecord
  has_many :clients, class_name: 'User'
  has_many :contacts, class_name: 'User'

  validates :name, :legal_representant_name, :legal_representant_email, :legal_representant_phone, :legal_representant_role, presence: true
end
