require 'test_helper'

class AttendanceRegularizationsControllerTest < ActionController::TestCase
  setup do
    @attendance_regularization = attendance_regularizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_regularizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_regularization" do
    assert_difference('AttendanceRegularization.count') do
      post :create, attendance_regularization: { date: @attendance_regularization.date, employee_id: @attendance_regularization.employee_id, justification: @attendance_regularization.justification, manager_id: @attendance_regularization.manager_id, regularization_reason_id: @attendance_regularization.regularization_reason_id, status: @attendance_regularization.status }
    end

    assert_redirected_to attendance_regularization_path(assigns(:attendance_regularization))
  end

  test "should show attendance_regularization" do
    get :show, id: @attendance_regularization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_regularization
    assert_response :success
  end

  test "should update attendance_regularization" do
    patch :update, id: @attendance_regularization, attendance_regularization: { date: @attendance_regularization.date, employee_id: @attendance_regularization.employee_id, justification: @attendance_regularization.justification, manager_id: @attendance_regularization.manager_id, regularization_reason_id: @attendance_regularization.regularization_reason_id, status: @attendance_regularization.status }
    assert_redirected_to attendance_regularization_path(assigns(:attendance_regularization))
  end

  test "should destroy attendance_regularization" do
    assert_difference('AttendanceRegularization.count', -1) do
      delete :destroy, id: @attendance_regularization
    end

    assert_redirected_to attendance_regularizations_path
  end
end
