require 'test_helper'

class PerformanceCalendarsControllerTest < ActionController::TestCase
  setup do
    @performance_calendar = performance_calendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performance_calendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance_calendar" do
    assert_difference('PerformanceCalendar.count') do
      post :create, performance_calendar: { end_date: @performance_calendar.end_date, performance_activity_id: @performance_calendar.performance_activity_id, period_id: @performance_calendar.period_id, start_date: @performance_calendar.start_date }
    end

    assert_redirected_to performance_calendar_path(assigns(:performance_calendar))
  end

  test "should show performance_calendar" do
    get :show, id: @performance_calendar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance_calendar
    assert_response :success
  end

  test "should update performance_calendar" do
    patch :update, id: @performance_calendar, performance_calendar: { end_date: @performance_calendar.end_date, performance_activity_id: @performance_calendar.performance_activity_id, period_id: @performance_calendar.period_id, start_date: @performance_calendar.start_date }
    assert_redirected_to performance_calendar_path(assigns(:performance_calendar))
  end

  test "should destroy performance_calendar" do
    assert_difference('PerformanceCalendar.count', -1) do
      delete :destroy, id: @performance_calendar
    end

    assert_redirected_to performance_calendars_path
  end
end
