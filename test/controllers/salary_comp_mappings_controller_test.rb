require 'test_helper'

class SalaryCompMappingsControllerTest < ActionController::TestCase
  setup do
    @salary_comp_mapping = salary_comp_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_comp_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_comp_mapping" do
    assert_difference('SalaryCompMapping.count') do
      post :create, salary_comp_mapping: { erp_account_code: @salary_comp_mapping.erp_account_code, salary_component_id: @salary_comp_mapping.salary_component_id, type: @salary_comp_mapping.type }
    end

    assert_redirected_to salary_comp_mapping_path(assigns(:salary_comp_mapping))
  end

  test "should show salary_comp_mapping" do
    get :show, id: @salary_comp_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_comp_mapping
    assert_response :success
  end

  test "should update salary_comp_mapping" do
    patch :update, id: @salary_comp_mapping, salary_comp_mapping: { erp_account_code: @salary_comp_mapping.erp_account_code, salary_component_id: @salary_comp_mapping.salary_component_id, type: @salary_comp_mapping.type }
    assert_redirected_to salary_comp_mapping_path(assigns(:salary_comp_mapping))
  end

  test "should destroy salary_comp_mapping" do
    assert_difference('SalaryCompMapping.count', -1) do
      delete :destroy, id: @salary_comp_mapping
    end

    assert_redirected_to salary_comp_mappings_path
  end
end
