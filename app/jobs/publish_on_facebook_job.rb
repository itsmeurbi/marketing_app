# frozen_string_literal: true

class PublishOnFacebookJob < ApplicationJob
  queue_as :default

  def perform(post)
    page = PageMannager.new(post)
    @response = if post.content.attached?
                  page.publish_image(post.content, post.body)
                else
                  page.publish_post(post.body)
                end
  end

  after_perform do |job|
    post = job.arguments.first
    post.update(published: true, facebook_id: @response['id'])
  end
end
