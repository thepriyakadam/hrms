require 'test_helper'

class TravelModesControllerTest < ActionController::TestCase
  setup do
    @travel_mode = travel_modes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_modes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_mode" do
    assert_difference('TravelMode.count') do
      post :create, travel_mode: { code: @travel_mode.code, description: @travel_mode.description, name: @travel_mode.name }
    end

    assert_redirected_to travel_mode_path(assigns(:travel_mode))
  end

  test "should show travel_mode" do
    get :show, id: @travel_mode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_mode
    assert_response :success
  end

  test "should update travel_mode" do
    patch :update, id: @travel_mode, travel_mode: { code: @travel_mode.code, description: @travel_mode.description, name: @travel_mode.name }
    assert_redirected_to travel_mode_path(assigns(:travel_mode))
  end

  test "should destroy travel_mode" do
    assert_difference('TravelMode.count', -1) do
      delete :destroy, id: @travel_mode
    end

    assert_redirected_to travel_modes_path
  end
end
