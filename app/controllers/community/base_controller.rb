# frozen_string_literal: true

module Community
  class BaseController < ApplicationController
    before_action :validate_user_role!
    layout 'application'

    def validate_user_role!
      return if current_user.is_content_community_manager?

      flash[:alert] = 'Accesos permitido solo para community managers'
      redirect_to root_path
    end
  end
end
