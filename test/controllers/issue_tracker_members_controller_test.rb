require 'test_helper'

class IssueTrackerMembersControllerTest < ActionController::TestCase
  setup do
    @issue_tracker_member = issue_tracker_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_tracker_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_tracker_member" do
    assert_difference('IssueTrackerMember.count') do
      post :create, issue_tracker_member: { employee_id: @issue_tracker_member.employee_id, is_confirm: @issue_tracker_member.is_confirm, issue_tracker_group_id: @issue_tracker_member.issue_tracker_group_id, status: @issue_tracker_member.status }
    end

    assert_redirected_to issue_tracker_member_path(assigns(:issue_tracker_member))
  end

  test "should show issue_tracker_member" do
    get :show, id: @issue_tracker_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_tracker_member
    assert_response :success
  end

  test "should update issue_tracker_member" do
    patch :update, id: @issue_tracker_member, issue_tracker_member: { employee_id: @issue_tracker_member.employee_id, is_confirm: @issue_tracker_member.is_confirm, issue_tracker_group_id: @issue_tracker_member.issue_tracker_group_id, status: @issue_tracker_member.status }
    assert_redirected_to issue_tracker_member_path(assigns(:issue_tracker_member))
  end

  test "should destroy issue_tracker_member" do
    assert_difference('IssueTrackerMember.count', -1) do
      delete :destroy, id: @issue_tracker_member
    end

    assert_redirected_to issue_tracker_members_path
  end
end
