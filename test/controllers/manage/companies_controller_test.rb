# frozen_string_literal: true

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test 'company user can get campains dashboard' do
    login_as users(:company)

    get manage_campains_path
    assert_response :success
  end

  test 'no company user can not access to campain dashboard' do
    login_as users(:designer)

    get manage_campains_path
    assert_response :redirect
  end
end
