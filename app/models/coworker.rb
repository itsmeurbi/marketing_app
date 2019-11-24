# frozen_string_literal: true

class Coworker < ApplicationRecord
  belongs_to :user
  belongs_to :campain
  delegate :email, to: :user
  validates :role, presence: true

  enum roles: %i[content_creator designer]

  def self.roles_mask_for_user
    [User.mask_for(:content_creator), User.mask_for(:designer)]
  end
end
