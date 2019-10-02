# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  include RoleModel
  belongs_to :company
  has_many :campains, foreign_key: 'manager_id'

  devise :database_authenticatable, :recoverable, :invitable, validate_on_invite: true

  roles_attribute :roles_mask
  roles :owner, :company, :community_manager, :content_creator, :designer, :rrhh, :finance
  scope :rrhh_and_finance_in_company, lambda { |company|
                                        where(company: company)
                                          .where('roles_mask = 32 OR roles_mask = 64')
                                      }
  validates :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
