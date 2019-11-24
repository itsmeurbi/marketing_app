# frozen_string_literal: true

module Community
  class NodesController < ApplicationController
    def create
      campain = Campain.find(params[:campain_id])
      respond_to do |format|
        format.json do
          node = campain.nodes.build(label: params[:label], color: '#34dbeb')
          if node.save
            render json: node
          else
            render json: node.errors
          end
        end
      end
    end

    def destroy
      node = Node.find(params[:id])
      respond_to do |format|
        format.json do
          if node.destroy
            render json: node
          else
            render json: node.errors
          end
        end
      end
    end

    def update
      node = Node.find(params[:id])
      respond_to do |format|
        format.json do
          if node.update(label: params[:node][:label])
            render json: node
          else
            render json: node.errors
          end
        end
      end
    end
  end
end
