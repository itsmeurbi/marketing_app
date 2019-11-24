# frozen_string_literal: true

module Community
  class EdgesController < BaseController
    def create
      edge = Edge.new(from_id: params[:from], to_id: params[:to])
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

    def destroy
      edge = Edge.find(params[:id])
      respond_to do |format|
        format.json do
          if edge.destroy
            render json: :success
          else
            render json: edge.errors
          end
        end
      end
    end
  end
end
