# frozen_string_literal: true

class PageMannager
  USER_TOKEN = ENV['FACEBOOK_TOKEN']
  attr_accessor :user_graph, :page_graph

  def initialize(post)
    page_token = if post.node.campain.encrypted_page_token.blank?
                   @user_graph = Koala::Facebook::API.new(USER_TOKEN)
                   user_graph.get_connections('me', 'accounts')
                             .first['access_token']
                 else
                   post.node.campain.encrypted_page_token
                 end
    @page = Koala::Facebook::API.new(page_token)
  end

  def publish_image(file, content)
    image = if Rails.env.production?
              file.content.blob.service_url
            else
              ActiveStorage::Blob.service.path_for(file.key)
            end
    @page.put_picture(image, file.content_type, { caption: content }, 'me')
  end

  def publish_post(body)
    @page.put_connections('me', 'feed', message: body)
  end

  def get_post_reactions(facebook_id)
    @page.get_object(facebook_id, fields: 'reactions.summary(true)')['reactions']['data']
  rescue StandardError
    'error'
  end

  def get_post_comments(facebook_id)
    @page.get_object(facebook_id, fields: 'comments')['comments']['data']
  rescue StandardError
    'error'
  end
end
