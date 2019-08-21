# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    super
    resource.role = params[:user][:role]
    return unless resource.valid?

    resource.save!
  end
end
