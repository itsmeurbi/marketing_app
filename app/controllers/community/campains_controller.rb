# frozen_string_literal: true

module Community
  class CampainsController < BaseController
    def index
      @campains = current_user.campains
    end

    def show
      respond_to do |format|
        format.html do
          build_html
        end
        format.json do
          build_json
        end
      end
    end

    private

    def build_html
      @campain = current_user.campains.find(params[:id])
      @coworker = @campain.coworkers.build
    end

    def build_json
      @campain = current_user.campains.find(params[:id])
      render json: { nodes: @campain.nodes, edges: @campain.edges }
    end
  end
end
