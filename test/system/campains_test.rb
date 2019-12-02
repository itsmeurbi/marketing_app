require "application_system_test_case"

class CampainsTest < ApplicationSystemTestCase
  setup do
    @campain = campains(:one)
  end

  test "visiting the index" do
    visit campains_url
    assert_selector "h1", text: "Campains"
  end

  test "creating a Campain" do
    visit campains_url
    click_on "New Campain"

    fill_in "End date", with: @campain.end_date
    fill_in "Name", with: @campain.name
    fill_in "Producto", with: @campain.producto
    fill_in "Start date", with: @campain.start_date
    fill_in "User", with: @campain.user_id
    click_on "Create Campain"

    assert_text "Campain was successfully created"
    click_on "Back"
  end

  test "updating a Campain" do
    visit campains_url
    click_on "Edit", match: :first

    fill_in "End date", with: @campain.end_date
    fill_in "Name", with: @campain.name
    fill_in "Producto", with: @campain.producto
    fill_in "Start date", with: @campain.start_date
    fill_in "User", with: @campain.user_id
    click_on "Update Campain"

    assert_text "Campain was successfully updated"
    click_on "Back"
  end

  test "destroying a Campain" do
    visit campains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Campain was successfully destroyed"
  end
end
