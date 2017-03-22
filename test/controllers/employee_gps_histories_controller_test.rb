require 'test_helper'

class EmployeeGpsHistoriesControllerTest < ActionController::TestCase
  setup do
    @employee_gps_history = employee_gps_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_gps_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_gps_history" do
    assert_difference('EmployeeGpsHistory.count') do
      post :create, employee_gps_history: { from_date: @employee_gps_history.from_date, latitude: @employee_gps_history.latitude, location: @employee_gps_history.location, longitude: @employee_gps_history.longitude, member_id: @employee_gps_history.member_id, to_date: @employee_gps_history.to_date }
    end

    assert_redirected_to employee_gps_history_path(assigns(:employee_gps_history))
  end

  test "should show employee_gps_history" do
    get :show, id: @employee_gps_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_gps_history
    assert_response :success
  end

  test "should update employee_gps_history" do
    patch :update, id: @employee_gps_history, employee_gps_history: { from_date: @employee_gps_history.from_date, latitude: @employee_gps_history.latitude, location: @employee_gps_history.location, longitude: @employee_gps_history.longitude, member_id: @employee_gps_history.member_id, to_date: @employee_gps_history.to_date }
    assert_redirected_to employee_gps_history_path(assigns(:employee_gps_history))
  end

  test "should destroy employee_gps_history" do
    assert_difference('EmployeeGpsHistory.count', -1) do
      delete :destroy, id: @employee_gps_history
    end

    assert_redirected_to employee_gps_histories_path
  end
end
