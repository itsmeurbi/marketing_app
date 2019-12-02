require 'test_helper'

class CampainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campain = campains(:one)
  end

  test "should get index" do
    get campains_url
    assert_response :success
  end

  test "should get new" do
    get new_campain_url
    assert_response :success
  end

  test "should create campain" do
    assert_difference('Campain.count') do
      post campains_url, params: { campain: { end_date: @campain.end_date, name: @campain.name, producto: @campain.producto, start_date: @campain.start_date, user_id: @campain.user_id } }
    end

    assert_redirected_to campain_url(Campain.last)
  end

  test "should show campain" do
    get campain_url(@campain)
    assert_response :success
  end

  test "should get edit" do
    get edit_campain_url(@campain)
    assert_response :success
  end

  test "should update campain" do
    patch campain_url(@campain), params: { campain: { end_date: @campain.end_date, name: @campain.name, producto: @campain.producto, start_date: @campain.start_date, user_id: @campain.user_id } }
    assert_redirected_to campain_url(@campain)
  end

  test "should destroy campain" do
    assert_difference('Campain.count', -1) do
      delete campain_url(@campain)
    end

    assert_redirected_to campains_url
  end
end
