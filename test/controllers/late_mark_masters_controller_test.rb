require 'test_helper'

class LateMarkMastersControllerTest < ActionController::TestCase
  setup do
    @late_mark_master = late_mark_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:late_mark_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create late_mark_master" do
    assert_difference('LateMarkMaster.count') do
      post :create, late_mark_master: { from: @late_mark_master.from, is_active: @late_mark_master.is_active, is_confirm: @late_mark_master.is_confirm, late_mark: @late_mark_master.late_mark, to: @late_mark_master.to }
    end

    assert_redirected_to late_mark_master_path(assigns(:late_mark_master))
  end

  test "should show late_mark_master" do
    get :show, id: @late_mark_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @late_mark_master
    assert_response :success
  end

  test "should update late_mark_master" do
    patch :update, id: @late_mark_master, late_mark_master: { from: @late_mark_master.from, is_active: @late_mark_master.is_active, is_confirm: @late_mark_master.is_confirm, late_mark: @late_mark_master.late_mark, to: @late_mark_master.to }
    assert_redirected_to late_mark_master_path(assigns(:late_mark_master))
  end

  test "should destroy late_mark_master" do
    assert_difference('LateMarkMaster.count', -1) do
      delete :destroy, id: @late_mark_master
    end

    assert_redirected_to late_mark_masters_path
  end
end
