require 'test_helper'

class SalaryMapSapsControllerTest < ActionController::TestCase
  setup do
    @salary_map_sap = salary_map_saps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_map_saps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_map_sap" do
    assert_difference('SalaryMapSap.count') do
      post :create, salary_map_sap: { account_code: @salary_map_sap.account_code, is_debit: @salary_map_sap.is_debit, salary_component_id: @salary_map_sap.salary_component_id }
    end

    assert_redirected_to salary_map_sap_path(assigns(:salary_map_sap))
  end

  test "should show salary_map_sap" do
    get :show, id: @salary_map_sap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_map_sap
    assert_response :success
  end

  test "should update salary_map_sap" do
    patch :update, id: @salary_map_sap, salary_map_sap: { account_code: @salary_map_sap.account_code, is_debit: @salary_map_sap.is_debit, salary_component_id: @salary_map_sap.salary_component_id }
    assert_redirected_to salary_map_sap_path(assigns(:salary_map_sap))
  end

  test "should destroy salary_map_sap" do
    assert_difference('SalaryMapSap.count', -1) do
      delete :destroy, id: @salary_map_sap
    end

    assert_redirected_to salary_map_saps_path
  end
end
