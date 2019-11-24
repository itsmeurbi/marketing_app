# frozen_string_literal: true

module Designer
  class BaseController < ApplicationController
    before_action :validate_user_role!

    def validate_user_role!
      return if current_user.is_designer?

      flash[:alert] = 'Accesos permitido solo para los diseñadores'
      redirect_to root_path
    end
  end
end
