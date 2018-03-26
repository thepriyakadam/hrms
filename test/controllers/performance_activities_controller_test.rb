require 'test_helper'

class PerformanceActivitiesControllerTest < ActionController::TestCase
  setup do
    @performance_activity = performance_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performance_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance_activity" do
    assert_difference('PerformanceActivity.count') do
      post :create, performance_activity: { code: @performance_activity.code, description: @performance_activity.description, name: @performance_activity.name }
    end

    assert_redirected_to performance_activity_path(assigns(:performance_activity))
  end

  test "should show performance_activity" do
    get :show, id: @performance_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance_activity
    assert_response :success
  end

  test "should update performance_activity" do
    patch :update, id: @performance_activity, performance_activity: { code: @performance_activity.code, description: @performance_activity.description, name: @performance_activity.name }
    assert_redirected_to performance_activity_path(assigns(:performance_activity))
  end

  test "should destroy performance_activity" do
    assert_difference('PerformanceActivity.count', -1) do
      delete :destroy, id: @performance_activity
    end

    assert_redirected_to performance_activities_path
  end
end
