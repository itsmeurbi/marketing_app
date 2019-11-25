# frozen_string_literal: true

class PublicationsController < ApplicationController
  def new
    post = Post.find(params[:id])
    PublishOnFacebookJob.perform_later(post)
  end
end
