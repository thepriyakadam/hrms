require 'test_helper'

class EmployeeGpsControllerTest < ActionController::TestCase
  setup do
    @employee_gp = employee_gps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_gps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_gp" do
    assert_difference('EmployeeGp.count') do
      post :create, employee_gp: { employee_id: @employee_gp.employee_id, from_date: @employee_gp.from_date, latitude: @employee_gp.latitude, location: @employee_gp.location, longitude: @employee_gp.longitude, to_date: @employee_gp.to_date }
    end

    assert_redirected_to employee_gp_path(assigns(:employee_gp))
  end

  test "should show employee_gp" do
    get :show, id: @employee_gp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_gp
    assert_response :success
  end

  test "should update employee_gp" do
    patch :update, id: @employee_gp, employee_gp: { employee_id: @employee_gp.employee_id, from_date: @employee_gp.from_date, latitude: @employee_gp.latitude, location: @employee_gp.location, longitude: @employee_gp.longitude, to_date: @employee_gp.to_date }
    assert_redirected_to employee_gp_path(assigns(:employee_gp))
  end

  test "should destroy employee_gp" do
    assert_difference('EmployeeGp.count', -1) do
      delete :destroy, id: @employee_gp
    end

    assert_redirected_to employee_gps_path
  end
end
