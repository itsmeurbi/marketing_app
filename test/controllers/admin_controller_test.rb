# frozen_string_literal: true

require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'owner user can visit dashboard' do
    login_as users(:owner)

    get admin_users_path
    assert_response :success
  end

  test 'no owner user can not access to dashboard' do
    login_as users(:designer)

    get admin_users_path
    assert_response :redirect
  end
end
