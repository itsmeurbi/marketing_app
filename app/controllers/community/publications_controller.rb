# frozen_string_literal: true

module Community
  class PublicationsController < ApplicationController
    def new
      post = Post.find(params[:post_id])
      if post.auto_publish
        PublishOnFacebookJob.set(wait_until: post.publish_at).perform_later(post)
      else
        PublishOnFacebookJob.perform_later(post)
      end
      redirect_to community_campain_path(post.node.campain)
    end
  end
end
