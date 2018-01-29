require 'test_helper'

class MeetingMinutesControllerTest < ActionController::TestCase
  setup do
    @meeting_minute = meeting_minutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeting_minutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting_minute" do
    assert_difference('MeetingMinute.count') do
      post :create, meeting_minute: { employee_plan_id: @meeting_minute.employee_plan_id, minutes: @meeting_minute.minutes }
    end

    assert_redirected_to meeting_minute_path(assigns(:meeting_minute))
  end

  test "should show meeting_minute" do
    get :show, id: @meeting_minute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting_minute
    assert_response :success
  end

  test "should update meeting_minute" do
    patch :update, id: @meeting_minute, meeting_minute: { employee_plan_id: @meeting_minute.employee_plan_id, minutes: @meeting_minute.minutes }
    assert_redirected_to meeting_minute_path(assigns(:meeting_minute))
  end

  test "should destroy meeting_minute" do
    assert_difference('MeetingMinute.count', -1) do
      delete :destroy, id: @meeting_minute
    end

    assert_redirected_to meeting_minutes_path
  end
end
