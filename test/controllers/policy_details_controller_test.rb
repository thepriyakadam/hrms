require 'test_helper'

class PolicyDetailsControllerTest < ActionController::TestCase
  setup do
    @policy_detail = policy_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:policy_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create policy_detail" do
    assert_difference('PolicyDetail.count') do
      post :create, policy_detail: { actual_annual_amount: @policy_detail.actual_annual_amount, estimated_annual_amount: @policy_detail.estimated_annual_amount, frequency: @policy_detail.frequency, insurer: @policy_detail.insurer, investment_declaration_id: @policy_detail.investment_declaration_id, policy_no: @policy_detail.policy_no, premium_amount: @policy_detail.premium_amount, relation: @policy_detail.relation }
    end

    assert_redirected_to policy_detail_path(assigns(:policy_detail))
  end

  test "should show policy_detail" do
    get :show, id: @policy_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @policy_detail
    assert_response :success
  end

  test "should update policy_detail" do
    patch :update, id: @policy_detail, policy_detail: { actual_annual_amount: @policy_detail.actual_annual_amount, estimated_annual_amount: @policy_detail.estimated_annual_amount, frequency: @policy_detail.frequency, insurer: @policy_detail.insurer, investment_declaration_id: @policy_detail.investment_declaration_id, policy_no: @policy_detail.policy_no, premium_amount: @policy_detail.premium_amount, relation: @policy_detail.relation }
    assert_redirected_to policy_detail_path(assigns(:policy_detail))
  end

  test "should destroy policy_detail" do
    assert_difference('PolicyDetail.count', -1) do
      delete :destroy, id: @policy_detail
    end

    assert_redirected_to policy_details_path
  end
end
