# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user
  belongs_to :corporation
end
