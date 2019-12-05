# frozen_string_literal: true

class FacebookNotifierMailer < ApplicationMailer
  def facebook_post
    @post = Post.find(params[:id])
    user_email = @post.node.campain.manager.email
    mail(to: user_email, subject: 'Se ha publicado nuevo contenido a la campaña')
  end
end
