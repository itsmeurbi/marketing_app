# frozen_string_literal: true

class User < ApplicationRecord
  include RoleModel
  belongs_to :company
  has_many :campains, foreign_key: 'manager_id'

  devise :database_authenticatable, :recoverable, :invitable

  roles_attribute :roles_mask
  roles :owner, :company, :community_manager, :content_creator, :designer, :rrhh, :finance
end
