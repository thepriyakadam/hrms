require 'test_helper'

class LeaveMastersControllerTest < ActionController::TestCase
  setup do
    @leave_master = leave_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_master" do
    assert_difference('LeaveMaster.count') do
      post :create, leave_master: { is_carry_forward: @leave_master.is_carry_forward, leav_category_id: @leave_master.leav_category_id, limit: @leave_master.limit, no_of_leave: @leave_master.no_of_leave, period: @leave_master.period, working_day: @leave_master.working_day }
    end

    assert_redirected_to leave_master_path(assigns(:leave_master))
  end

  test "should show leave_master" do
    get :show, id: @leave_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_master
    assert_response :success
  end

  test "should update leave_master" do
    patch :update, id: @leave_master, leave_master: { is_carry_forward: @leave_master.is_carry_forward, leav_category_id: @leave_master.leav_category_id, limit: @leave_master.limit, no_of_leave: @leave_master.no_of_leave, period: @leave_master.period, working_day: @leave_master.working_day }
    assert_redirected_to leave_master_path(assigns(:leave_master))
  end

  test "should destroy leave_master" do
    assert_difference('LeaveMaster.count', -1) do
      delete :destroy, id: @leave_master
    end

    assert_redirected_to leave_masters_path
  end
end
