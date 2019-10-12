# frozen_string_literal: true

require 'test_helper'

module Admin
  class ClientsControllerTest < ActionDispatch::IntegrationTest
    test 'it response success when owner access to dashboard' do
      login_as users(:owner)

      get admin_clients_path

      assert_response :success
    end

    test 'it redirect when owner access to dashboard' do
      login_as users(:rrhh)

      get admin_clients_path

      assert_response :redirect
    end
  end
end
