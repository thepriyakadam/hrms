require 'test_helper'

class EmployeePlansControllerTest < ActionController::TestCase
  setup do
    @employee_plan = employee_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_plan" do
    assert_difference('EmployeePlan.count') do
      post :create, employee_plan: { conform: @employee_plan.conform, current_status: @employee_plan.current_status, employee_id: @employee_plan.employee_id, from_date: @employee_plan.from_date, from_time: @employee_plan.from_time, lat: @employee_plan.lat, lng: @employee_plan.lng, location: @employee_plan.location, manager_id: @employee_plan.manager_id, meeting_agenda: @employee_plan.meeting_agenda, meeting_with: @employee_plan.meeting_with, status: @employee_plan.status, to_date: @employee_plan.to_date, to_time: @employee_plan.to_time }
    end

    assert_redirected_to employee_plan_path(assigns(:employee_plan))
  end

  test "should show employee_plan" do
    get :show, id: @employee_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_plan
    assert_response :success
  end

  test "should update employee_plan" do
    patch :update, id: @employee_plan, employee_plan: { conform: @employee_plan.conform, current_status: @employee_plan.current_status, employee_id: @employee_plan.employee_id, from_date: @employee_plan.from_date, from_time: @employee_plan.from_time, lat: @employee_plan.lat, lng: @employee_plan.lng, location: @employee_plan.location, manager_id: @employee_plan.manager_id, meeting_agenda: @employee_plan.meeting_agenda, meeting_with: @employee_plan.meeting_with, status: @employee_plan.status, to_date: @employee_plan.to_date, to_time: @employee_plan.to_time }
    assert_redirected_to employee_plan_path(assigns(:employee_plan))
  end

  test "should destroy employee_plan" do
    assert_difference('EmployeePlan.count', -1) do
      delete :destroy, id: @employee_plan
    end

    assert_redirected_to employee_plans_path
  end
end
