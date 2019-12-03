# frozen_string_literal: true

module Community
  class PublicationsController < ApplicationController
    def new
      post = Post.find(params[:post_id])
      if post.auto_publish
        Resque.enqueue_at(post.publish_at, PublishOnFacebookJob, post)
      else
        PublishOnFacebookJob.perform_later(post)
      end
      redirect_to community_campain_path(post.node.campain)
    end
  end
end
