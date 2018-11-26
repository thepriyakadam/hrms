require 'test_helper'

class ShiftSchedulesControllerTest < ActionController::TestCase
  setup do
    @shift_schedule = shift_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shift_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shift_schedule" do
    assert_difference('ShiftSchedule.count') do
      post :create, shift_schedule: { from: @shift_schedule.from, shift_time_id: @shift_schedule.shift_time_id, status: @shift_schedule.status, to: @shift_schedule.to }
    end

    assert_redirected_to shift_schedule_path(assigns(:shift_schedule))
  end

  test "should show shift_schedule" do
    get :show, id: @shift_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift_schedule
    assert_response :success
  end

  test "should update shift_schedule" do
    patch :update, id: @shift_schedule, shift_schedule: { from: @shift_schedule.from, shift_time_id: @shift_schedule.shift_time_id, status: @shift_schedule.status, to: @shift_schedule.to }
    assert_redirected_to shift_schedule_path(assigns(:shift_schedule))
  end

  test "should destroy shift_schedule" do
    assert_difference('ShiftSchedule.count', -1) do
      delete :destroy, id: @shift_schedule
    end

    assert_redirected_to shift_schedules_path
  end
end
