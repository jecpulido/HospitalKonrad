require 'test_helper'

class ProfesionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesion = profesions(:one)
  end

  test "should get index" do
    get profesions_url
    assert_response :success
  end

  test "should get new" do
    get new_profesion_url
    assert_response :success
  end

  test "should create profesion" do
    assert_difference('Profesion.count') do
      post profesions_url, params: { profesion: { description: @profesion.description, name: @profesion.name } }
    end

    assert_redirected_to profesion_url(Profesion.last)
  end

  test "should show profesion" do
    get profesion_url(@profesion)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesion_url(@profesion)
    assert_response :success
  end

  test "should update profesion" do
    patch profesion_url(@profesion), params: { profesion: { description: @profesion.description, name: @profesion.name } }
    assert_redirected_to profesion_url(@profesion)
  end

  test "should destroy profesion" do
    assert_difference('Profesion.count', -1) do
      delete profesion_url(@profesion)
    end

    assert_redirected_to profesions_url
  end
end
