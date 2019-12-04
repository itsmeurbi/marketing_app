# frozen_string_literal: true

class PostCommentsStaticsticsController < ApplicationController
  def index
    campain = Campain.find(params[:campain_id])
    render json: Chart.posts_comments_statistics(campain)
  end

  def show
    post = Post.find(params[:id])
    render json: Chart.post_comments_staticstics(post)
  end
end
