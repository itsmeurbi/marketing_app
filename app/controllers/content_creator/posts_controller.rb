# frozen_string_literal: true

module ContentCreator
  class PostsController < ApplicationController

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "Post actualizado correctamente"
      else
        flash[:alert] = "Error actualizando el post"
      end
      redirect_to content_creator_campain_path(@post.node.campain)
    end

    private

    def post_params
      params.require(:post).permit(:content, :body)
    end
  end
end
