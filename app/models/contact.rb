# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :corporation
end
