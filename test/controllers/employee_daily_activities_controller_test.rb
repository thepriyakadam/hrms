require 'test_helper'

class EmployeeDailyActivitiesControllerTest < ActionController::TestCase
  setup do
    @employee_daily_activity = employee_daily_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_daily_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_daily_activity" do
    assert_difference('EmployeeDailyActivity.count') do
      post :create, employee_daily_activity: { employee_id: @employee_daily_activity.employee_id, project_master_id: @employee_daily_activity.project_master_id, today_activity: @employee_daily_activity.today_activity, tomorrow_plan: @employee_daily_activity.tomorrow_plan }
    end

    assert_redirected_to employee_daily_activity_path(assigns(:employee_daily_activity))
  end

  test "should show employee_daily_activity" do
    get :show, id: @employee_daily_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_daily_activity
    assert_response :success
  end

  test "should update employee_daily_activity" do
    patch :update, id: @employee_daily_activity, employee_daily_activity: { employee_id: @employee_daily_activity.employee_id, project_master_id: @employee_daily_activity.project_master_id, today_activity: @employee_daily_activity.today_activity, tomorrow_plan: @employee_daily_activity.tomorrow_plan }
    assert_redirected_to employee_daily_activity_path(assigns(:employee_daily_activity))
  end

  test "should destroy employee_daily_activity" do
    assert_difference('EmployeeDailyActivity.count', -1) do
      delete :destroy, id: @employee_daily_activity
    end

    assert_redirected_to employee_daily_activities_path
  end
end
