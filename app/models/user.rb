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
  roles :owner,
        :company,
        :community_manager,
        :content_creator,
        :designer,
        :rrhh,
        :finance,
        :client

  scope :admin_manage_users, lambda { |company|
                               where(company: company)
                                 .where('roles_mask = 4
                                            OR roles_mask = 32
                                            OR roles_mask = 64
                                            OR roles_mask = 128
                                            OR roles_mask = 256')
                             }

  scope :with_role, lambda { |role|
                      where(roles_mask: User.mask_for(role))
                    }

  validates :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def self.admin_manage_roles
    %i[rrhh finance client contact]
  end
end
