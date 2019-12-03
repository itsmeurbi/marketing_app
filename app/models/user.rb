# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  include RoleModel

  belongs_to :company
  has_many :campains, foreign_key: 'manager_id'
  has_many :petitions
  has_many :messages
  has_many :chatrooms, through: :messages

  devise :database_authenticatable, :recoverable, :invitable, validate_on_invite: true

  roles_attribute :roles_mask
  roles :admin,
        :company,
        :community_manager,
        :content_creator,
        :designer,
        :rrhh,
        :finance,
        :client,
        :agency,
        :client_admin

  scope :admin_manage_users, lambda {
                               where('roles_mask = 4
                                            OR roles_mask = 32
                                            OR roles_mask = 64
                                            OR roles_mask = 128
                                            OR roles_mask = 256
                                            OR roles_mask = 512')
                             }

  scope :with_role, lambda { |role1, role2|
                      where('roles_mask = ? OR roles_mask = ?',
                            User.mask_for(role1),
                            User.mask_for(role2))
                    }
  scope :from_company, ->(company) { where(company: company) }

  validates :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def self.admin_manage_roles
    %i[rrhh finance client contact client_admin]
  end

  def self.client_admin_role
    %i[rrhh client]
  end

  def self.external_roles
    %i[client client_admin]
  end
end
