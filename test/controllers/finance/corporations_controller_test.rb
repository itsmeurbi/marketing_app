# frozen_string_literal: true

require 'test_helper'

module Finance
  class CorporationsControllerTest < ActionDispatch::IntegrationTest
    test 'it response success qhen finance access to dashboard' do
      login_as users(:finance)

      get finance_corporations_path

      assert_response :success
    end

    test 'it redirect when no finance access to dashboard' do
      login_as users(:admin)

      get finance_corporations_path

      assert_response :redirect
    end

    test 'it response success qhen finnance acces to corporation show' do
      corporation = corporations(:microsoft)
      login_as users(:finance)

      get finance_corporation_path(corporation)

      assert_response :success
    end
  end
end
