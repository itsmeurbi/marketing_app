# frozen_string_literal: true

module Designer
  class PostsController < BaseController
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = 'Post actualizado correctamente'
      else
        flash[:alert] = 'Error actualizando el post'
      end
      redirect_to designer_campain_path(@post.node.campain)
    end

    private

    def post_params
      params.require(:post).permit(:content, :content_status)
    end
  end
end
