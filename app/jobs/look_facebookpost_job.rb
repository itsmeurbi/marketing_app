# frozen_string_literal: true

require 'resque'

class LookFacebookpostJob
  @queue = :simple

  def self.perform
    end_date = Time.now + 10.minutes
    start_date = Time.now - 10.minutes
    posts = ::Post.where(auto_publish: true, publish_at: start_date..end_date)
    posts.each do |post|
      publish_post(post)
    end
  end

  def self.publish_post(post)
    page = PageMannager.new(post)
    response = if post.content.attached?
                 page.publish_image(post.content, post.body)
               else
                 page.publish_post(post.body)
               end
    post.update(published: true, facebook_id: response['id'])
  end
end
