require 'test_helper'

class EmployeeResignationsControllerTest < ActionController::TestCase
  setup do
    @employee_resignation = employee_resignations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_resignations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_resignation" do
    assert_difference('EmployeeResignation.count') do
      post :create, employee_resignation: { employee_id: @employee_resignation.employee_id, exit_interview_date: @employee_resignation.exit_interview_date, has_left: @employee_resignation.has_left, is_notice_period: @employee_resignation.is_notice_period, leaving_date: @employee_resignation.leaving_date, note: @employee_resignation.note, notice_period: @employee_resignation.notice_period, notice_served: @employee_resignation.notice_served, reason: @employee_resignation.reason, rehired: @employee_resignation.rehired, remark: @employee_resignation.remark, resignation_date: @employee_resignation.resignation_date, settled_on: @employee_resignation.settled_on, short_notice_period: @employee_resignation.short_notice_period, tentative_leaving_date: @employee_resignation.tentative_leaving_date }
    end

    assert_redirected_to employee_resignation_path(assigns(:employee_resignation))
  end

  test "should show employee_resignation" do
    get :show, id: @employee_resignation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_resignation
    assert_response :success
  end

  test "should update employee_resignation" do
    patch :update, id: @employee_resignation, employee_resignation: { employee_id: @employee_resignation.employee_id, exit_interview_date: @employee_resignation.exit_interview_date, has_left: @employee_resignation.has_left, is_notice_period: @employee_resignation.is_notice_period, leaving_date: @employee_resignation.leaving_date, note: @employee_resignation.note, notice_period: @employee_resignation.notice_period, notice_served: @employee_resignation.notice_served, reason: @employee_resignation.reason, rehired: @employee_resignation.rehired, remark: @employee_resignation.remark, resignation_date: @employee_resignation.resignation_date, settled_on: @employee_resignation.settled_on, short_notice_period: @employee_resignation.short_notice_period, tentative_leaving_date: @employee_resignation.tentative_leaving_date }
    assert_redirected_to employee_resignation_path(assigns(:employee_resignation))
  end

  test "should destroy employee_resignation" do
    assert_difference('EmployeeResignation.count', -1) do
      delete :destroy, id: @employee_resignation
    end

    assert_redirected_to employee_resignations_path
  end
end
