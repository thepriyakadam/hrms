require 'test_helper'

class DearnessAllowancesControllerTest < ActionController::TestCase
  setup do
    @dearness_allowance = dearness_allowances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dearness_allowances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dearness_allowance" do
    assert_difference('DearnessAllowance.count') do
      post :create, dearness_allowance: { base_component: @dearness_allowance.base_component, effective_from: @dearness_allowance.effective_from, effective_to: @dearness_allowance.effective_to, is_active: @dearness_allowance.is_active, is_confirm: @dearness_allowance.is_confirm, minimum_wages: @dearness_allowance.minimum_wages }
    end

    assert_redirected_to dearness_allowance_path(assigns(:dearness_allowance))
  end

  test "should show dearness_allowance" do
    get :show, id: @dearness_allowance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dearness_allowance
    assert_response :success
  end

  test "should update dearness_allowance" do
    patch :update, id: @dearness_allowance, dearness_allowance: { base_component: @dearness_allowance.base_component, effective_from: @dearness_allowance.effective_from, effective_to: @dearness_allowance.effective_to, is_active: @dearness_allowance.is_active, is_confirm: @dearness_allowance.is_confirm, minimum_wages: @dearness_allowance.minimum_wages }
    assert_redirected_to dearness_allowance_path(assigns(:dearness_allowance))
  end

  test "should destroy dearness_allowance" do
    assert_difference('DearnessAllowance.count', -1) do
      delete :destroy, id: @dearness_allowance
    end

    assert_redirected_to dearness_allowances_path
  end
end
