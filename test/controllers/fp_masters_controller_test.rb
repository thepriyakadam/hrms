require 'test_helper'

class FpMastersControllerTest < ActionController::TestCase
  setup do
    @fp_master = fp_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fp_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fp_master" do
    assert_difference('FpMaster.count') do
      post :create, fp_master: { base_component: @fp_master.base_component, effective_from: @fp_master.effective_from, effective_to: @fp_master.effective_to, is_active: @fp_master.is_active, is_confirm: @fp_master.is_confirm, is_fp: @fp_master.is_fp, min_limit: @fp_master.min_limit, percentage: @fp_master.percentage }
    end

    assert_redirected_to fp_master_path(assigns(:fp_master))
  end

  test "should show fp_master" do
    get :show, id: @fp_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fp_master
    assert_response :success
  end

  test "should update fp_master" do
    patch :update, id: @fp_master, fp_master: { base_component: @fp_master.base_component, effective_from: @fp_master.effective_from, effective_to: @fp_master.effective_to, is_active: @fp_master.is_active, is_confirm: @fp_master.is_confirm, is_fp: @fp_master.is_fp, min_limit: @fp_master.min_limit, percentage: @fp_master.percentage }
    assert_redirected_to fp_master_path(assigns(:fp_master))
  end

  test "should destroy fp_master" do
    assert_difference('FpMaster.count', -1) do
      delete :destroy, id: @fp_master
    end

    assert_redirected_to fp_masters_path
  end
end
