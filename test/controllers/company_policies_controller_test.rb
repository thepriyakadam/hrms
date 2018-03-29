require 'test_helper'

class CompanyPoliciesControllerTest < ActionController::TestCase
  setup do
    @company_policy = company_policies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_policies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_policy" do
    assert_difference('CompanyPolicy.count') do
      post :create, company_policy: { document: @company_policy.document, effective_from: @company_policy.effective_from, effective_to: @company_policy.effective_to, name: @company_policy.name, status: @company_policy.status }
    end

    assert_redirected_to company_policy_path(assigns(:company_policy))
  end

  test "should show company_policy" do
    get :show, id: @company_policy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_policy
    assert_response :success
  end

  test "should update company_policy" do
    patch :update, id: @company_policy, company_policy: { document: @company_policy.document, effective_from: @company_policy.effective_from, effective_to: @company_policy.effective_to, name: @company_policy.name, status: @company_policy.status }
    assert_redirected_to company_policy_path(assigns(:company_policy))
  end

  test "should destroy company_policy" do
    assert_difference('CompanyPolicy.count', -1) do
      delete :destroy, id: @company_policy
    end

    assert_redirected_to company_policies_path
  end
end
