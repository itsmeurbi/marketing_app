# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, :legal_representant_name, :legal_representant_email, :legal_representant_phone, :legal_representant_role, :bussines_name, :rfc, :location, presence: true

end
