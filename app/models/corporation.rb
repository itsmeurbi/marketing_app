# frozen_string_literal: true

class Corporation < ApplicationRecord
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :contacts

  validates :name,
            :legal_representant_name,
            :legal_representant_email,
            :legal_representant_phone,
            :legal_representant_role, presence: true
end
