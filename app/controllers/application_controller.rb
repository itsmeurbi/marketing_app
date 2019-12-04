# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :register_log_update, only: %i[update]
  after_action :register_log_delete, only: %i[delete]
  after_action :register_log_create, only: %i[create]

  def register_log_update
    controller = params[:controller].split('/').first
    Log.create(action: 'Se actualizó el recurso',
               user_email: current_user.email,
               controller: controller,
               resource: params[:id])
  end

  def register_log_delete
    controller = params[:controller].split('/').first
    Log.create(action: 'Se eliminó el recurso',
               user_email: current_user.email,
               controller: controller,
               resource: params[:id])
  end

  def register_log_create
    controller = params[:controller].split('/').first
    Log.create(action: 'Recurso creado',
               user_email: current_user.email,
               controller: controller)
  end
end
