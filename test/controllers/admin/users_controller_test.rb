# frozen_string_literal: true

require 'test_helper'

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test 'admin user can access to dashboard' do
      login_as users(:admin)

      get admin_users_path

      assert_response :success
    end

    test 'no admin user can not access to dashboard' do
      login_as users(:rrhh)

      get admin_users_path

      assert_response :redirect
    end

    test 'it response success when admin access user show' do
      user = users(:rrhh)
      login_as users(:admin)

      get admin_user_path(user)

      assert_response :success
    end
  end
end
