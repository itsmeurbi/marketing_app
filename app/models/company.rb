# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :employees, class_name: 'User'
  has_many :campains, as: :company

  validates :name,
            :legal_representant_name,
            :legal_representant_email,
            :legal_representant_phone,
            :legal_representant_role,
            :bussines_name,
            :rfc,
            :location, presence: true
end
