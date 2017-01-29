require 'test_helper'

class MachineAttendancesControllerTest < ActionController::TestCase
  setup do
    @machine_attendance = machine_attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_attendance" do
    assert_difference('MachineAttendance.count') do
      post :create, machine_attendance: { day: @machine_attendance.day, employee_id: @machine_attendance.employee_id, in: @machine_attendance.in, out: @machine_attendance.out }
    end

    assert_redirected_to machine_attendance_path(assigns(:machine_attendance))
  end

  test "should show machine_attendance" do
    get :show, id: @machine_attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_attendance
    assert_response :success
  end

  test "should update machine_attendance" do
    patch :update, id: @machine_attendance, machine_attendance: { day: @machine_attendance.day, employee_id: @machine_attendance.employee_id, in: @machine_attendance.in, out: @machine_attendance.out }
    assert_redirected_to machine_attendance_path(assigns(:machine_attendance))
  end

  test "should destroy machine_attendance" do
    assert_difference('MachineAttendance.count', -1) do
      delete :destroy, id: @machine_attendance
    end

    assert_redirected_to machine_attendances_path
  end
end
