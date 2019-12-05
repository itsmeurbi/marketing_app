# frozen_string_literal: true

module Community
  class DashboardsController < ApplicationController
    def show
      @campain = current_user.campains.find(params[:id])
      @coworker = @campain.coworkers.build
    end
  end
end
