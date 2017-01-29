require 'test_helper'

class IssueMastersControllerTest < ActionController::TestCase
  setup do
    @issue_master = issue_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_master" do
    assert_difference('IssueMaster.count') do
      post :create, issue_master: { description: @issue_master.description, is_confirm: @issue_master.is_confirm, issue_tracker_group_id: @issue_master.issue_tracker_group_id, issue_type_id: @issue_master.issue_type_id, name: @issue_master.name, status: @issue_master.status }
    end

    assert_redirected_to issue_master_path(assigns(:issue_master))
  end

  test "should show issue_master" do
    get :show, id: @issue_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_master
    assert_response :success
  end

  test "should update issue_master" do
    patch :update, id: @issue_master, issue_master: { description: @issue_master.description, is_confirm: @issue_master.is_confirm, issue_tracker_group_id: @issue_master.issue_tracker_group_id, issue_type_id: @issue_master.issue_type_id, name: @issue_master.name, status: @issue_master.status }
    assert_redirected_to issue_master_path(assigns(:issue_master))
  end

  test "should destroy issue_master" do
    assert_difference('IssueMaster.count', -1) do
      delete :destroy, id: @issue_master
    end

    assert_redirected_to issue_masters_path
  end
end
