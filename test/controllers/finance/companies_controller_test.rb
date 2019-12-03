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
      login_as users(:admin)

      get finance_companies_path

      assert_response :redirect
    end

    test 'it response success when finance access to company show' do
      login_as users(:finance)
      company = companies(:microsoft)

      get finance_company_path(company)

      assert_response :success
    end
  end
end
