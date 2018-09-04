require "application_system_test_case"

class ProfesionsTest < ApplicationSystemTestCase
  setup do
    @profesion = profesions(:one)
  end

  test "visiting the index" do
    visit profesions_url
    assert_selector "h1", text: "Profesions"
  end

  test "creating a Profesion" do
    visit profesions_url
    click_on "New Profesion"

    fill_in "Description", with: @profesion.description
    fill_in "Name", with: @profesion.name
    click_on "Create Profesion"

    assert_text "Profesion was successfully created"
    click_on "Back"
  end

  test "updating a Profesion" do
    visit profesions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @profesion.description
    fill_in "Name", with: @profesion.name
    click_on "Update Profesion"

    assert_text "Profesion was successfully updated"
    click_on "Back"
  end

  test "destroying a Profesion" do
    visit profesions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profesion was successfully destroyed"
  end
end
