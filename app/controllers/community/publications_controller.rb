# frozen_string_literal: true

module Community
  class PublicationsController < ApplicationController
    def new
      post = Post.find(params[:post_id])
      PublishOnFacebookJob.perform_later(post)
      redirect_to community_campain_path(post.node.campain)
    end
  end
end
