# frozen_string_literal: true

module Community
  class ApplicationController < ActionController::Base
    before_action :authenticate_admin
    layout 'application'

    def authenticate_admin
      redirect_to root_path unless user_signed_in? && current_user.is_community_manager?
    end
  end
end
