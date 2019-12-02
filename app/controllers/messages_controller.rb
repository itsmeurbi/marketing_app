# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    recipient_id = params[:message][:recipient_id]
    chatroom = Chatroom.first
    @message = chatroom.messages.create(message_params)
    send_user_message(recipient_id)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image, :recipient_id).merge(user: current_user)
  end

  def send_user_message(recipient_id)
    ActionCable.server.broadcast "chatroom_channel", author_email: current_user.email, content: @message.content
  end
end
