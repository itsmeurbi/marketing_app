# frozen_string_literal: true

module ContentCreator
  class CampainsController < ApplicationController
    before_action :initialize_coworker, only: %i[show]

    def index
      @campains = Campain.coworker_campains(current_user)
    end

    def show
      @campain = Campain.find(params[:id])
      @petitions = Petition.coworker_petitions(@coworker)
    end

    private

    def initialize_coworker
      @coworker = Coworker.find_by(user: current_user, campain_id: params[:id])
    end
  end
end
