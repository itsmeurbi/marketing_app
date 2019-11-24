# frozen_string_literal: true

module ContentCreator
  class BaseController < ApplicationController
    before_action :validate_user_role!

    def validate_user_role!
      return if current_user.is_content_creator?

      flash[:alert] = 'Accesos permitido solo para creadores de contenido'
      redirect_to root_path
    end
  end
end
