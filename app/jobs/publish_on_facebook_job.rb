# frozen_string_literal: true

class PublishOnFacebookJob < ApplicationJob
  queue_as :default

  def perform(post)
    page = PageMannager.new(post)
    if post.content.attached?
      page.publish_image(post.content, post.body)
    else
      @response = page.publish_post(post.body)
    end
  end

  after_perform do |job|
    post = job.arguments.first
    post.update(published: true, facebook_id: @response['id'])
  end
end
