# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
require_relative '../../helpers/chart_helper'

module Consumer
  class ApplicationController < Administrate::ApplicationController
    before_action :validate_user_role!

    def validate_user_role!
      return if current_user.client?

      flash[:alert] = 'Accesos permitido solo para community managers'
      redirect_to root_path
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
