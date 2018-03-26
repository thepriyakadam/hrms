require 'test_helper'

class TransportAllowancesControllerTest < ActionController::TestCase
  setup do
    @transport_allowance = transport_allowances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_allowances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_allowance" do
    assert_difference('TransportAllowance.count') do
      post :create, transport_allowance: { amount: @transport_allowance.amount, employee_id: @transport_allowance.employee_id, option: @transport_allowance.option, status: @transport_allowance.status }
    end

    assert_redirected_to transport_allowance_path(assigns(:transport_allowance))
  end

  test "should show transport_allowance" do
    get :show, id: @transport_allowance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_allowance
    assert_response :success
  end

  test "should update transport_allowance" do
    patch :update, id: @transport_allowance, transport_allowance: { amount: @transport_allowance.amount, employee_id: @transport_allowance.employee_id, option: @transport_allowance.option, status: @transport_allowance.status }
    assert_redirected_to transport_allowance_path(assigns(:transport_allowance))
  end

  test "should destroy transport_allowance" do
    assert_difference('TransportAllowance.count', -1) do
      delete :destroy, id: @transport_allowance
    end

    assert_redirected_to transport_allowances_path
  end
end
