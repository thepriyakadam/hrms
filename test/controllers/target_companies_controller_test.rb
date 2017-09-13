require 'test_helper'

class TargetCompaniesControllerTest < ActionController::TestCase
  setup do
    @target_company = target_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:target_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create target_company" do
    assert_difference('TargetCompany.count') do
      post :create, target_company: { code: @target_company.code, description: @target_company.description, name: @target_company.name, status: @target_company.status }
    end

    assert_redirected_to target_company_path(assigns(:target_company))
  end

  test "should show target_company" do
    get :show, id: @target_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @target_company
    assert_response :success
  end

  test "should update target_company" do
    patch :update, id: @target_company, target_company: { code: @target_company.code, description: @target_company.description, name: @target_company.name, status: @target_company.status }
    assert_redirected_to target_company_path(assigns(:target_company))
  end

  test "should destroy target_company" do
    assert_difference('TargetCompany.count', -1) do
      delete :destroy, id: @target_company
    end

    assert_redirected_to target_companies_path
  end
end
