require "application_system_test_case"

class CoworkersTest < ApplicationSystemTestCase
  setup do
    @coworker = coworkers(:one)
  end

  test "visiting the index" do
    visit coworkers_url
    assert_selector "h1", text: "Coworkers"
  end

  test "creating a Coworker" do
    visit coworkers_url
    click_on "New Coworker"

    fill_in "Campain", with: @coworker.campain_id
    fill_in "Role", with: @coworker.role
    fill_in "User", with: @coworker.user_id
    click_on "Create Coworker"

    assert_text "Coworker was successfully created"
    click_on "Back"
  end

  test "updating a Coworker" do
    visit coworkers_url
    click_on "Edit", match: :first

    fill_in "Campain", with: @coworker.campain_id
    fill_in "Role", with: @coworker.role
    fill_in "User", with: @coworker.user_id
    click_on "Update Coworker"

    assert_text "Coworker was successfully updated"
    click_on "Back"
  end

  test "destroying a Coworker" do
    visit coworkers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coworker was successfully destroyed"
  end
end
