# frozen_string_literal: true

class User < ApplicationRecord
  include RoleModel

  devise :database_authenticatable, :recoverable, :invitable

  roles_attribute :roles_mask
  roles :owner, :company, :comunnity_manager, :content_creator, :designer, :rrhh, :finance
end
