# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = Chatroom.last.messages.build(user: current_user,
                                            content: params[:message][:content])
    if @message.save
      flash[:notice] = 'Mensaje enviado'
    else
      flash[:alert] = 'Error enviando mensaje'
    end
    redirect_to designer_campains_path
  end
end
