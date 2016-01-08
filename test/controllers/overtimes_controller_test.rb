require 'test_helper'

class OvertimesControllerTest < ActionController::TestCase
  setup do
    @overtime = overtimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overtimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overtime" do
    assert_difference('Overtime.count') do
      post :create, overtime: { employee_id: @overtime.employee_id, normal_wages_rate: @overtime.normal_wages_rate, ot_date: @overtime.ot_date, ot_earning: @overtime.ot_earning, ot_total_hrs: @overtime.ot_total_hrs, ot_type: @overtime.ot_type, ot_wages_rate: @overtime.ot_wages_rate, paid_on_date: @overtime.paid_on_date, remarks: @overtime.remarks, total_production: @overtime.total_production }
    end

    assert_redirected_to overtime_path(assigns(:overtime))
  end

  test "should show overtime" do
    get :show, id: @overtime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overtime
    assert_response :success
  end

  test "should update overtime" do
    patch :update, id: @overtime, overtime: { employee_id: @overtime.employee_id, normal_wages_rate: @overtime.normal_wages_rate, ot_date: @overtime.ot_date, ot_earning: @overtime.ot_earning, ot_total_hrs: @overtime.ot_total_hrs, ot_type: @overtime.ot_type, ot_wages_rate: @overtime.ot_wages_rate, paid_on_date: @overtime.paid_on_date, remarks: @overtime.remarks, total_production: @overtime.total_production }
    assert_redirected_to overtime_path(assigns(:overtime))
  end

  test "should destroy overtime" do
    assert_difference('Overtime.count', -1) do
      delete :destroy, id: @overtime
    end

    assert_redirected_to overtimes_path
  end
end
