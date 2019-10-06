# frozen_string_literal: true

require 'test_helper'

module Finance
  class CompaniesControllerTest < ActionDispatch::IntegrationTest
    test 'finance user can visit dashboard' do
      login_as users(:finance)

      get finance_companies_path

      assert_response :success
    end

    test 'no finance user can not visit dashboard' do
      login_as users(:owner)

      get finance_companies_path

      assert_response :redirect
    end
  end
end
