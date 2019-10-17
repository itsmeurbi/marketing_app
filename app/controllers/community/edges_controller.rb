# frozen_string_literal: true

module Community
  class EdgesController < ApplicationController
    def create
      edge = Edge.new(node_from_id: params[:from], node_to_id: params[:to])
      respond_to do |format|
        format.json do
          if edge.save
            render json: edge
          else
            render json: edge.errors
          end
        end
      end
    end
  end
end
