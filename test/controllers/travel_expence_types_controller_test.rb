require 'test_helper'

class TravelExpenceTypesControllerTest < ActionController::TestCase
  setup do
    @travel_expence_type = travel_expence_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_expence_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_expence_type" do
    assert_difference('TravelExpenceType.count') do
      post :create, travel_expence_type: { code: @travel_expence_type.code, description: @travel_expence_type.description, name: @travel_expence_type.name }
    end

    assert_redirected_to travel_expence_type_path(assigns(:travel_expence_type))
  end

  test "should show travel_expence_type" do
    get :show, id: @travel_expence_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_expence_type
    assert_response :success
  end

  test "should update travel_expence_type" do
    patch :update, id: @travel_expence_type, travel_expence_type: { code: @travel_expence_type.code, description: @travel_expence_type.description, name: @travel_expence_type.name }
    assert_redirected_to travel_expence_type_path(assigns(:travel_expence_type))
  end

  test "should destroy travel_expence_type" do
    assert_difference('TravelExpenceType.count', -1) do
      delete :destroy, id: @travel_expence_type
    end

    assert_redirected_to travel_expence_types_path
  end
end
