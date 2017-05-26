require 'test_helper'

class IssueLockersControllerTest < ActionController::TestCase
  setup do
    @issue_locker = issue_lockers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_lockers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_locker" do
    assert_difference('IssueLocker.count') do
      post :create, issue_locker: { employee_id: @issue_locker.employee_id, issue_request_id: @issue_locker.issue_request_id, status: @issue_locker.status }
    end

    assert_redirected_to issue_locker_path(assigns(:issue_locker))
  end

  test "should show issue_locker" do
    get :show, id: @issue_locker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_locker
    assert_response :success
  end

  test "should update issue_locker" do
    patch :update, id: @issue_locker, issue_locker: { employee_id: @issue_locker.employee_id, issue_request_id: @issue_locker.issue_request_id, status: @issue_locker.status }
    assert_redirected_to issue_locker_path(assigns(:issue_locker))
  end

  test "should destroy issue_locker" do
    assert_difference('IssueLocker.count', -1) do
      delete :destroy, id: @issue_locker
    end

    assert_redirected_to issue_lockers_path
  end
end
