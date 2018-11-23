require 'test_helper'

class COffCashMastersControllerTest < ActionController::TestCase
  setup do
    @c_off_cash_master = c_off_cash_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_off_cash_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_off_cash_master" do
    assert_difference('COffCashMaster.count') do
      post :create, c_off_cash_master: { base_component: @c_off_cash_master.base_component, is_active: @c_off_cash_master.is_active, rate: @c_off_cash_master.rate }
    end

    assert_redirected_to c_off_cash_master_path(assigns(:c_off_cash_master))
  end

  test "should show c_off_cash_master" do
    get :show, id: @c_off_cash_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @c_off_cash_master
    assert_response :success
  end

  test "should update c_off_cash_master" do
    patch :update, id: @c_off_cash_master, c_off_cash_master: { base_component: @c_off_cash_master.base_component, is_active: @c_off_cash_master.is_active, rate: @c_off_cash_master.rate }
    assert_redirected_to c_off_cash_master_path(assigns(:c_off_cash_master))
  end

  test "should destroy c_off_cash_master" do
    assert_difference('COffCashMaster.count', -1) do
      delete :destroy, id: @c_off_cash_master
    end

    assert_redirected_to c_off_cash_masters_path
  end
end
