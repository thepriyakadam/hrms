require 'test_helper'

class GratuitiesControllerTest < ActionController::TestCase
  setup do
    @gratuity = gratuities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gratuities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gratuity" do
    assert_difference('Gratuity.count') do
      post :create, gratuity: { base_component: @gratuity.base_component, employee_id: @gratuity.employee_id, no_of_year: @gratuity.no_of_year, total_gratuity: @gratuity.total_gratuity }
    end

    assert_redirected_to gratuity_path(assigns(:gratuity))
  end

  test "should show gratuity" do
    get :show, id: @gratuity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gratuity
    assert_response :success
  end

  test "should update gratuity" do
    patch :update, id: @gratuity, gratuity: { base_component: @gratuity.base_component, employee_id: @gratuity.employee_id, no_of_year: @gratuity.no_of_year, total_gratuity: @gratuity.total_gratuity }
    assert_redirected_to gratuity_path(assigns(:gratuity))
  end

  test "should destroy gratuity" do
    assert_difference('Gratuity.count', -1) do
      delete :destroy, id: @gratuity
    end

    assert_redirected_to gratuities_path
  end
end
