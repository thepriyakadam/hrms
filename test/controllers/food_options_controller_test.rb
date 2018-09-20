require 'test_helper'

class FoodOptionsControllerTest < ActionController::TestCase
  setup do
    @food_option = food_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_option" do
    assert_difference('FoodOption.count') do
      post :create, food_option: { amount: @food_option.amount, code: @food_option.code, description: @food_option.description, is_optional: @food_option.is_optional, name: @food_option.name, status: @food_option.status, travel_option_id: @food_option.travel_option_id }
    end

    assert_redirected_to food_option_path(assigns(:food_option))
  end

  test "should show food_option" do
    get :show, id: @food_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_option
    assert_response :success
  end

  test "should update food_option" do
    patch :update, id: @food_option, food_option: { amount: @food_option.amount, code: @food_option.code, description: @food_option.description, is_optional: @food_option.is_optional, name: @food_option.name, status: @food_option.status, travel_option_id: @food_option.travel_option_id }
    assert_redirected_to food_option_path(assigns(:food_option))
  end

  test "should destroy food_option" do
    assert_difference('FoodOption.count', -1) do
      delete :destroy, id: @food_option
    end

    assert_redirected_to food_options_path
  end
end
