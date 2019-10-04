# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   foo = Foo.find(params[:id])
    #   foo.update(params[:foo])
    #   send_foo_updated_email
    # end
    def create
      user = User.invite!(email: params[:user][:email],
                          company: current_user.company,
                          roles_mask: params[:user][:roles_mask])
      if user.valid?
        flash[:notice] = 'El usuario fue registrado correctamente'
      else
        flash[:alert] = 'Error registrando al usuario'
      end
      redirect_to admin_users_path
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
    # def scoped_resource
    #  if current_user.super_admin?
    #    resource_class
    #  else
    #    resource_class.with_less_stuff
    #  end
    # end

    def scoped_resource
      User.rrhh_and_finance_in_company(current_user.company)
    end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
