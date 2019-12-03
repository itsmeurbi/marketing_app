# frozen_string_literal: true

require 'test_helper'

module Admin
  class ClientsControllerTest < ActionDispatch::IntegrationTest
    test 'it response success when admin access to dashboard' do
      login_as users(:admin)

      get admin_clients_path

      assert_response :success
    end

    test 'it redirect when admin access to dashboard' do
      login_as users(:rrhh)

      get admin_clients_path

      assert_response :redirect
    end
  end
end
