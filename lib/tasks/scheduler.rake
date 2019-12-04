# frozen_string_literal: true

task find_posts: :environment do
  end_date = Time.now + 10.minutes
  start_date = Time.now - 10.minutes
  posts = ::Post.where(auto_publish: true, publish_at: start_date..end_date)

  puts 'NO POSTS FOUNDS' unless posts.any?

  posts.each do |post|
    page = PageMannager.new(post)
    response = if post.content.attached?
                 page.publish_image(post.content, post.body)
               else
                 page.publish_post(post.body)
               end
    post.update(published: true, facebook_id: response['id'])
    FacebookNotifierMailer.with(id: post.id).facebook_post.deliver_later
  end
  puts 'LOOKING FOR SOME FACEBOOK POSTS'
end
