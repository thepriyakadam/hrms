require 'test_helper'

class LeaveCashMastersControllerTest < ActionController::TestCase
  setup do
    @leave_cash_master = leave_cash_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_cash_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_cash_master" do
    assert_difference('LeaveCashMaster.count') do
      post :create, leave_cash_master: { base_component: @leave_cash_master.base_component, is_active: @leave_cash_master.is_active, is_confirm: @leave_cash_master.is_confirm, rate: @leave_cash_master.rate }
    end

    assert_redirected_to leave_cash_master_path(assigns(:leave_cash_master))
  end

  test "should show leave_cash_master" do
    get :show, id: @leave_cash_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_cash_master
    assert_response :success
  end

  test "should update leave_cash_master" do
    patch :update, id: @leave_cash_master, leave_cash_master: { base_component: @leave_cash_master.base_component, is_active: @leave_cash_master.is_active, is_confirm: @leave_cash_master.is_confirm, rate: @leave_cash_master.rate }
    assert_redirected_to leave_cash_master_path(assigns(:leave_cash_master))
  end

  test "should destroy leave_cash_master" do
    assert_difference('LeaveCashMaster.count', -1) do
      delete :destroy, id: @leave_cash_master
    end

    assert_redirected_to leave_cash_masters_path
  end
end
