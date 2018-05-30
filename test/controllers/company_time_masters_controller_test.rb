require 'test_helper'

class CompanyTimeMastersControllerTest < ActionController::TestCase
  setup do
    @company_time_master = company_time_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_time_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_time_master" do
    assert_difference('CompanyTimeMaster.count') do
      post :create, company_time_master: { in_max_time: @company_time_master.in_max_time, in_min_time: @company_time_master.in_min_time, is_active: @company_time_master.is_active, is_confirm: @company_time_master.is_confirm, out_max_time: @company_time_master.out_max_time, out_min_time: @company_time_master.out_min_time, working_hrs: @company_time_master.working_hrs }
    end

    assert_redirected_to company_time_master_path(assigns(:company_time_master))
  end

  test "should show company_time_master" do
    get :show, id: @company_time_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_time_master
    assert_response :success
  end

  test "should update company_time_master" do
    patch :update, id: @company_time_master, company_time_master: { in_max_time: @company_time_master.in_max_time, in_min_time: @company_time_master.in_min_time, is_active: @company_time_master.is_active, is_confirm: @company_time_master.is_confirm, out_max_time: @company_time_master.out_max_time, out_min_time: @company_time_master.out_min_time, working_hrs: @company_time_master.working_hrs }
    assert_redirected_to company_time_master_path(assigns(:company_time_master))
  end

  test "should destroy company_time_master" do
    assert_difference('CompanyTimeMaster.count', -1) do
      delete :destroy, id: @company_time_master
    end

    assert_redirected_to company_time_masters_path
  end
end
