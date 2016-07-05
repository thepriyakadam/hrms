require 'test_helper'

class SettingMastersControllerTest < ActionController::TestCase
  setup do
    @setting_master = setting_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setting_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting_master" do
    assert_difference('SettingMaster.count') do
      post :create, setting_master: { date: @setting_master.date, email: @setting_master.email, precision: @setting_master.precision, timeformat: @setting_master.timeformat }
    end

    assert_redirected_to setting_master_path(assigns(:setting_master))
  end

  test "should show setting_master" do
    get :show, id: @setting_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting_master
    assert_response :success
  end

  test "should update setting_master" do
    patch :update, id: @setting_master, setting_master: { date: @setting_master.date, email: @setting_master.email, precision: @setting_master.precision, timeformat: @setting_master.timeformat }
    assert_redirected_to setting_master_path(assigns(:setting_master))
  end

  test "should destroy setting_master" do
    assert_difference('SettingMaster.count', -1) do
      delete :destroy, id: @setting_master
    end

    assert_redirected_to setting_masters_path
  end
end
