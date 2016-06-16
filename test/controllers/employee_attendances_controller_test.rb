require 'test_helper'

class EmployeeAttendancesControllerTest < ActionController::TestCase
  setup do
    @employee_attendance = employee_attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_attendance" do
    assert_difference('EmployeeAttendance.count') do
      post :create, employee_attendance: { day: @employee_attendance.day, employee_id: @employee_attendance.employee_id, in: @employee_attendance.in, out: @employee_attendance.out, present: @employee_attendance.present }
    end

    assert_redirected_to employee_attendance_path(assigns(:employee_attendance))
  end

  test "should show employee_attendance" do
    get :show, id: @employee_attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_attendance
    assert_response :success
  end

  test "should update employee_attendance" do
    patch :update, id: @employee_attendance, employee_attendance: { day: @employee_attendance.day, employee_id: @employee_attendance.employee_id, in: @employee_attendance.in, out: @employee_attendance.out, present: @employee_attendance.present }
    assert_redirected_to employee_attendance_path(assigns(:employee_attendance))
  end

  test "should destroy employee_attendance" do
    assert_difference('EmployeeAttendance.count', -1) do
      delete :destroy, id: @employee_attendance
    end

    assert_redirected_to employee_attendances_path
  end
end
