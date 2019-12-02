require 'test_helper'

class CoworkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coworker = coworkers(:one)
  end

  test "should get index" do
    get coworkers_url
    assert_response :success
  end

  test "should get new" do
    get new_coworker_url
    assert_response :success
  end

  test "should create coworker" do
    assert_difference('Coworker.count') do
      post coworkers_url, params: { coworker: { campain_id: @coworker.campain_id, role: @coworker.role, user_id: @coworker.user_id } }
    end

    assert_redirected_to coworker_url(Coworker.last)
  end

  test "should show coworker" do
    get coworker_url(@coworker)
    assert_response :success
  end

  test "should get edit" do
    get edit_coworker_url(@coworker)
    assert_response :success
  end

  test "should update coworker" do
    patch coworker_url(@coworker), params: { coworker: { campain_id: @coworker.campain_id, role: @coworker.role, user_id: @coworker.user_id } }
    assert_redirected_to coworker_url(@coworker)
  end

  test "should destroy coworker" do
    assert_difference('Coworker.count', -1) do
      delete coworker_url(@coworker)
    end

    assert_redirected_to coworkers_url
  end
end
