require 'test_helper'

class PayrollOvertimeMastersControllerTest < ActionController::TestCase
  setup do
    @payroll_overtime_master = payroll_overtime_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payroll_overtime_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payroll_overtime_master" do
    assert_difference('PayrollOvertimeMaster.count') do
      post :create, payroll_overtime_master: { base_component: @payroll_overtime_master.base_component, is_active: @payroll_overtime_master.is_active, is_confirm: @payroll_overtime_master.is_confirm, is_payroll: @payroll_overtime_master.is_payroll, rate: @payroll_overtime_master.rate }
    end

    assert_redirected_to payroll_overtime_master_path(assigns(:payroll_overtime_master))
  end

  test "should show payroll_overtime_master" do
    get :show, id: @payroll_overtime_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payroll_overtime_master
    assert_response :success
  end

  test "should update payroll_overtime_master" do
    patch :update, id: @payroll_overtime_master, payroll_overtime_master: { base_component: @payroll_overtime_master.base_component, is_active: @payroll_overtime_master.is_active, is_confirm: @payroll_overtime_master.is_confirm, is_payroll: @payroll_overtime_master.is_payroll, rate: @payroll_overtime_master.rate }
    assert_redirected_to payroll_overtime_master_path(assigns(:payroll_overtime_master))
  end

  test "should destroy payroll_overtime_master" do
    assert_difference('PayrollOvertimeMaster.count', -1) do
      delete :destroy, id: @payroll_overtime_master
    end

    assert_redirected_to payroll_overtime_masters_path
  end
end
