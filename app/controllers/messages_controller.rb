# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    respond_to do |format|
      format.js do
        @message = Chatroom.last.messages.build(message_params)
        if @message.save
          send_message
        else
          flash[:alert] = 'Error enviando mensaje'
        end
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user: current_user)
  end

  def send_message
    image_url = if @message.image.attached?
                  url_for(@message.image)
                else
                  ''
                end
    ActionCable.server.broadcast 'chatroom_channel', content: @message.content,
                                                     author: @message.user.email,
                                                     image: image_url
  end
end
