require 'test_helper'

class ApprovalProcessesControllerTest < ActionController::TestCase
  setup do
    @approval_process = approval_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approval_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approval_process" do
    assert_difference('ApprovalProcess.count') do
      post :create, approval_process: { from: @approval_process.from, membership_id: @approval_process.membership_id, status: @approval_process.status, to: @approval_process.to }
    end

    assert_redirected_to approval_process_path(assigns(:approval_process))
  end

  test "should show approval_process" do
    get :show, id: @approval_process
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approval_process
    assert_response :success
  end

  test "should update approval_process" do
    patch :update, id: @approval_process, approval_process: { from: @approval_process.from, membership_id: @approval_process.membership_id, status: @approval_process.status, to: @approval_process.to }
    assert_redirected_to approval_process_path(assigns(:approval_process))
  end

  test "should destroy approval_process" do
    assert_difference('ApprovalProcess.count', -1) do
      delete :destroy, id: @approval_process
    end

    assert_redirected_to approval_processes_path
  end
end
