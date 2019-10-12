# frozen_string_literal: true

require 'test_helper'

module Admin
  class CampainsControllerTest < ActionDispatch::IntegrationTest
    test 'it response success when owner accces to dashboard' do
      login_as users(:owner)

      get admin_campains_path

      assert_response :success
    end

    test 'it redirect when no owner acces to dashboard' do
      login_as users(:rrhh)

      get admin_campains_path

      assert_response :redirect
    end

    test 'it response success when owner access to a campain' do
      campain = campains(:iphone_campain)
      login_as users(:owner)

      get admin_campain_path(campain)

      assert_response :success
    end

    test 'it response success when owner access to new campain' do
      login_as users(:owner)

      get new_admin_campain_path

      assert_response :success
    end

    test 'it response success when owner acccess to campain edit' do
      campain = campains(:iphone_campain)
      login_as users(:owner)

      get edit_admin_campain_path(campain)

      assert_response :success
    end
  end
end
