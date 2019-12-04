class PostSentimentsController < ApplicationController
  def show
    post = Post.find(params[:id])
    render json: Chart.post_statistics(post)
  end

  def index
    campain = Campain.find(params[:campain_id])
    render json: Chart.posts_statistics(campain)
  end
end
