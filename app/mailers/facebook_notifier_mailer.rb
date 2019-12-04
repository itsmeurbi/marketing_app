# frozen_string_literal: true

class FacebookNotifierMailer < ApplicationMailer
  def facebook_post
    @post = Post.find(params[:id])
    mail(to: ENV['SUPPORT_MAIL'], subject: 'Se ha publicado nuevo contenido a la campaña')
  end
end
