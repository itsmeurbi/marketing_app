# frozen_string_literal: true

require 'test_helper'

module Admin
  class CompaniesControllerTest < ActionDispatch::IntegrationTest
    test 'it response success when owner access to dashboard' do
      login_as users(:owner)

      get admin_companies_path

      assert_response :success
    end

    test 'it redirect when no owner access to dashboard' do
      login_as users(:rrhh)

      get admin_companies_path

      assert_response :redirect
    end

    test 'it response success when owner access to a company' do
      company = companies(:microsoft)
      login_as users(:owner)

      get admin_company_path(company)

      assert_response :success
    end
  end
end
