require 'test_helper'

class InductionActivitiesControllerTest < ActionController::TestCase
  setup do
    @induction_activity = induction_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:induction_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create induction_activity" do
    assert_difference('InductionActivity.count') do
      post :create, induction_activity: { activity: @induction_activity.activity, day: @induction_activity.day, duration: @induction_activity.duration, employee_id: @induction_activity.employee_id, induction_master_id: @induction_activity.induction_master_id }
    end

    assert_redirected_to induction_activity_path(assigns(:induction_activity))
  end

  test "should show induction_activity" do
    get :show, id: @induction_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @induction_activity
    assert_response :success
  end

  test "should update induction_activity" do
    patch :update, id: @induction_activity, induction_activity: { activity: @induction_activity.activity, day: @induction_activity.day, duration: @induction_activity.duration, employee_id: @induction_activity.employee_id, induction_master_id: @induction_activity.induction_master_id }
    assert_redirected_to induction_activity_path(assigns(:induction_activity))
  end

  test "should destroy induction_activity" do
    assert_difference('InductionActivity.count', -1) do
      delete :destroy, id: @induction_activity
    end

    assert_redirected_to induction_activities_path
  end
end
