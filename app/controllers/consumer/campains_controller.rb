# frozen_string_literal: true

module Consumer
  class CampainsController < Consumer::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   foo = Foo.find(params[:id])
    #   foo.update(params[:foo])
    #   send_foo_updated_email
    # end

    def index
      client = Client.find_by(user: current_user)
      @campains = Campain.where(company: client.corporation)
      super
    end

    def show
      @campain = Campain.find(params[:id])
      super
    end
    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
