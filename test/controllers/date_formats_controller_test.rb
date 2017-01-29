require 'test_helper'

class DateFormatsControllerTest < ActionController::TestCase
  setup do
    @date_format = date_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_format" do
    assert_difference('DateFormat.count') do
      post :create, date_format: { name: @date_format.name, value: @date_format.value }
    end

    assert_redirected_to date_format_path(assigns(:date_format))
  end

  test "should show date_format" do
    get :show, id: @date_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_format
    assert_response :success
  end

  test "should update date_format" do
    patch :update, id: @date_format, date_format: { name: @date_format.name, value: @date_format.value }
    assert_redirected_to date_format_path(assigns(:date_format))
  end

  test "should destroy date_format" do
    assert_difference('DateFormat.count', -1) do
      delete :destroy, id: @date_format
    end

    assert_redirected_to date_formats_path
  end
end
