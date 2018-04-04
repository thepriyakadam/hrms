require 'test_helper'

class MembershipContributionsControllerTest < ActionController::TestCase
  setup do
    @membership_contribution = membership_contributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membership_contributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membership_contribution" do
    assert_difference('MembershipContribution.count') do
      post :create, membership_contribution: { amount: @membership_contribution.amount, date: @membership_contribution.date, membership_id: @membership_contribution.membership_id }
    end

    assert_redirected_to membership_contribution_path(assigns(:membership_contribution))
  end

  test "should show membership_contribution" do
    get :show, id: @membership_contribution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membership_contribution
    assert_response :success
  end

  test "should update membership_contribution" do
    patch :update, id: @membership_contribution, membership_contribution: { amount: @membership_contribution.amount, date: @membership_contribution.date, membership_id: @membership_contribution.membership_id }
    assert_redirected_to membership_contribution_path(assigns(:membership_contribution))
  end

  test "should destroy membership_contribution" do
    assert_difference('MembershipContribution.count', -1) do
      delete :destroy, id: @membership_contribution
    end

    assert_redirected_to membership_contributions_path
  end
end
