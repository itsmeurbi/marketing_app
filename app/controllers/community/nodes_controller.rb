# frozen_string_literal: true

module Community
  class NodesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      campain = Campain.find(params[:campain_id])
      respond_to do |format|
        format.json do
          node = campain.nodes.build(label: params[:label])
          if node.save
            render json: node
          else
            render json: node.errors
          end
        end
      end
    end
  end
end
