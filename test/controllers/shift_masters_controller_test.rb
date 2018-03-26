require 'test_helper'

class ShiftMastersControllerTest < ActionController::TestCase
  setup do
    @shift_master = shift_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shift_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shift_master" do
    assert_difference('ShiftMaster.count') do
      post :create, shift_master: { code: @shift_master.code, description: @shift_master.description, is_active: @shift_master.is_active, is_confirm: @shift_master.is_confirm, name: @shift_master.name }
    end

    assert_redirected_to shift_master_path(assigns(:shift_master))
  end

  test "should show shift_master" do
    get :show, id: @shift_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift_master
    assert_response :success
  end

  test "should update shift_master" do
    patch :update, id: @shift_master, shift_master: { code: @shift_master.code, description: @shift_master.description, is_active: @shift_master.is_active, is_confirm: @shift_master.is_confirm, name: @shift_master.name }
    assert_redirected_to shift_master_path(assigns(:shift_master))
  end

  test "should destroy shift_master" do
    assert_difference('ShiftMaster.count', -1) do
      delete :destroy, id: @shift_master
    end

    assert_redirected_to shift_masters_path
  end
end
