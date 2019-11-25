# frozen_string_literal: true

class PublishOnFacebookJob < ApplicationJob
  queue_as :default

  def perform(post)
    page = PageMannager.new
    if post.content.attached?
      page.publish_image(post.content, post.body)
    else
      page.publish_post(post.body)
    end
  end
end
