# frozen_string_literal: true

require 'test_helper'

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test 'owner user can access to dashboard' do
      login_as users(:owner)

      get admin_users_path

      assert_response :success
    end

    test 'no owner user can not access to dashboard' do
      login_as users(:rrhh)

      get admin_users_path

      assert_response :redirect
    end

    test 'it response success when owner access user show' do
      user = users(:rrhh)
      login_as users(:owner)

      get admin_user_path(user)

      assert_response :success
    end
  end
end
