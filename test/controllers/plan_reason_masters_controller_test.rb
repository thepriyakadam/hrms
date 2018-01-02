require 'test_helper'

class PlanReasonMastersControllerTest < ActionController::TestCase
  setup do
    @plan_reason_master = plan_reason_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_reason_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_reason_master" do
    assert_difference('PlanReasonMaster.count') do
      post :create, plan_reason_master: { code: @plan_reason_master.code, description: @plan_reason_master.description, name: @plan_reason_master.name, status: @plan_reason_master.status }
    end

    assert_redirected_to plan_reason_master_path(assigns(:plan_reason_master))
  end

  test "should show plan_reason_master" do
    get :show, id: @plan_reason_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan_reason_master
    assert_response :success
  end

  test "should update plan_reason_master" do
    patch :update, id: @plan_reason_master, plan_reason_master: { code: @plan_reason_master.code, description: @plan_reason_master.description, name: @plan_reason_master.name, status: @plan_reason_master.status }
    assert_redirected_to plan_reason_master_path(assigns(:plan_reason_master))
  end

  test "should destroy plan_reason_master" do
    assert_difference('PlanReasonMaster.count', -1) do
      delete :destroy, id: @plan_reason_master
    end

    assert_redirected_to plan_reason_masters_path
  end
end
