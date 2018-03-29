require 'test_helper'

class PayrollPeriodsControllerTest < ActionController::TestCase
  setup do
    @payroll_period = payroll_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payroll_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payroll_period" do
    assert_difference('PayrollPeriod.count') do
      post :create, payroll_period: { from: @payroll_period.from, status: @payroll_period.status, to: @payroll_period.to }
    end

    assert_redirected_to payroll_period_path(assigns(:payroll_period))
  end

  test "should show payroll_period" do
    get :show, id: @payroll_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payroll_period
    assert_response :success
  end

  test "should update payroll_period" do
    patch :update, id: @payroll_period, payroll_period: { from: @payroll_period.from, status: @payroll_period.status, to: @payroll_period.to }
    assert_redirected_to payroll_period_path(assigns(:payroll_period))
  end

  test "should destroy payroll_period" do
    assert_difference('PayrollPeriod.count', -1) do
      delete :destroy, id: @payroll_period
    end

    assert_redirected_to payroll_periods_path
  end
end
