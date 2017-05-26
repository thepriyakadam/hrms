require 'test_helper'

class WeekOffMastersControllerTest < ActionController::TestCase
  setup do
    @week_off_master = week_off_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:week_off_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create week_off_master" do
    assert_difference('WeekOffMaster.count') do
      post :create, week_off_master: { day: @week_off_master.day, employee_id: @week_off_master.employee_id, is_active: @week_off_master.is_active }
    end

    assert_redirected_to week_off_master_path(assigns(:week_off_master))
  end

  test "should show week_off_master" do
    get :show, id: @week_off_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @week_off_master
    assert_response :success
  end

  test "should update week_off_master" do
    patch :update, id: @week_off_master, week_off_master: { day: @week_off_master.day, employee_id: @week_off_master.employee_id, is_active: @week_off_master.is_active }
    assert_redirected_to week_off_master_path(assigns(:week_off_master))
  end

  test "should destroy week_off_master" do
    assert_difference('WeekOffMaster.count', -1) do
      delete :destroy, id: @week_off_master
    end

    assert_redirected_to week_off_masters_path
  end
end
