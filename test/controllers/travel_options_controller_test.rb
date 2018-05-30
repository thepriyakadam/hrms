require 'test_helper'

class TravelOptionsControllerTest < ActionController::TestCase
  setup do
    @travel_option = travel_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_option" do
    assert_difference('TravelOption.count') do
      post :create, travel_option: { code: @travel_option.code, discription: @travel_option.discription, name: @travel_option.name }
    end

    assert_redirected_to travel_option_path(assigns(:travel_option))
  end

  test "should show travel_option" do
    get :show, id: @travel_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_option
    assert_response :success
  end

  test "should update travel_option" do
    patch :update, id: @travel_option, travel_option: { code: @travel_option.code, discription: @travel_option.discription, name: @travel_option.name }
    assert_redirected_to travel_option_path(assigns(:travel_option))
  end

  test "should destroy travel_option" do
    assert_difference('TravelOption.count', -1) do
      delete :destroy, id: @travel_option
    end

    assert_redirected_to travel_options_path
  end
end
