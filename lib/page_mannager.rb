# frozen_string_literal: true

class PageMannager
  attr_accessor :user_graph, :page_graph

  def initialize
    @user_graph = Koala::Facebook::API.new(Rails.application.credentials.facebook_token)
    page_token = user_graph.get_connections('me', 'accounts').first['access_token']
    @page = Koala::Facebook::API.new(page_token)
  end

  def publish_image(file, content)
    file_path = ActiveStorage::Blob.service.path_for(file.key)
    @page.put_picture(file_path, file.content_type, { caption: content }, 'me')
  end

  def publish_post(body)
    @page.put_connections('me', 'feed', message: body)
  end
end
