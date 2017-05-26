require 'test_helper'

class ReportingMasterRembursmentsControllerTest < ActionController::TestCase
  setup do
    @reporting_master_rembursment = reporting_master_rembursments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reporting_master_rembursments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reporting_master_rembursment" do
    assert_difference('ReportingMasterRembursment.count') do
      post :create, reporting_master_rembursment: { manager_id: @reporting_master_rembursment.manager_id, rembursment_id: @reporting_master_rembursment.rembursment_id, status: @reporting_master_rembursment.status }
    end

    assert_redirected_to reporting_master_rembursment_path(assigns(:reporting_master_rembursment))
  end

  test "should show reporting_master_rembursment" do
    get :show, id: @reporting_master_rembursment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reporting_master_rembursment
    assert_response :success
  end

  test "should update reporting_master_rembursment" do
    patch :update, id: @reporting_master_rembursment, reporting_master_rembursment: { manager_id: @reporting_master_rembursment.manager_id, rembursment_id: @reporting_master_rembursment.rembursment_id, status: @reporting_master_rembursment.status }
    assert_redirected_to reporting_master_rembursment_path(assigns(:reporting_master_rembursment))
  end

  test "should destroy reporting_master_rembursment" do
    assert_difference('ReportingMasterRembursment.count', -1) do
      delete :destroy, id: @reporting_master_rembursment
    end

    assert_redirected_to reporting_master_rembursments_path
  end
end
