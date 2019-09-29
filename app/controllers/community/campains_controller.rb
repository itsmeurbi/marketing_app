# frozen_string_literal: true

# frozen_string_iteral: true

module Community
  class CampainsController < ApplicationController
    def index
      @campains = current_user.campains
    end

    def show
      @campain = current_user.campains.find(params[:id])
    end
  end
end
