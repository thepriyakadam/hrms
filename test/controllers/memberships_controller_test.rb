require 'test_helper'

class MembershipsControllerTest < ActionController::TestCase
  setup do
    @membership = memberships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membership" do
    assert_difference('Membership.count') do
      post :create, membership: { contribution: @membership.contribution, date: @membership.date, employee_id: @membership.employee_id, membership_type_id: @membership.membership_type_id }
    end

    assert_redirected_to membership_path(assigns(:membership))
  end

  test "should show membership" do
    get :show, id: @membership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membership
    assert_response :success
  end

  test "should update membership" do
    patch :update, id: @membership, membership: { contribution: @membership.contribution, date: @membership.date, employee_id: @membership.employee_id, membership_type_id: @membership.membership_type_id }
    assert_redirected_to membership_path(assigns(:membership))
  end

  test "should destroy membership" do
    assert_difference('Membership.count', -1) do
      delete :destroy, id: @membership
    end

    assert_redirected_to memberships_path
  end
end
