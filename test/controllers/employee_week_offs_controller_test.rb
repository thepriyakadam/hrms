require 'test_helper'

class EmployeeWeekOffsControllerTest < ActionController::TestCase
  setup do
    @employee_week_off = employee_week_offs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_week_offs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_week_off" do
    assert_difference('EmployeeWeekOff.count') do
      post :create, employee_week_off: { date: @employee_week_off.date, day: @employee_week_off.day, employee_id: @employee_week_off.employee_id, is_confirm: @employee_week_off.is_confirm, status: @employee_week_off.status, week_off_master_id: @employee_week_off.week_off_master_id }
    end

    assert_redirected_to employee_week_off_path(assigns(:employee_week_off))
  end

  test "should show employee_week_off" do
    get :show, id: @employee_week_off
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_week_off
    assert_response :success
  end

  test "should update employee_week_off" do
    patch :update, id: @employee_week_off, employee_week_off: { date: @employee_week_off.date, day: @employee_week_off.day, employee_id: @employee_week_off.employee_id, is_confirm: @employee_week_off.is_confirm, status: @employee_week_off.status, week_off_master_id: @employee_week_off.week_off_master_id }
    assert_redirected_to employee_week_off_path(assigns(:employee_week_off))
  end

  test "should destroy employee_week_off" do
    assert_difference('EmployeeWeekOff.count', -1) do
      delete :destroy, id: @employee_week_off
    end

    assert_redirected_to employee_week_offs_path
  end
end
