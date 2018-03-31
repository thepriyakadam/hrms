require 'test_helper'

class TrainingApprovalsControllerTest < ActionController::TestCase
  setup do
    @training_approval = training_approvals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_approvals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_approval" do
    assert_difference('TrainingApproval.count') do
      post :create, training_approval: { description: @training_approval.description, employee_id: @training_approval.employee_id, justification: @training_approval.justification, no_of_employee: @training_approval.no_of_employee, place: @training_approval.place, reporting_master_id: @training_approval.reporting_master_id, training_date: @training_approval.training_date, training_request_id: @training_approval.training_request_id, training_topic_master_id: @training_approval.training_topic_master_id, traininig_period: @training_approval.traininig_period }
    end

    assert_redirected_to training_approval_path(assigns(:training_approval))
  end

  test "should show training_approval" do
    get :show, id: @training_approval
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_approval
    assert_response :success
  end

  test "should update training_approval" do
    patch :update, id: @training_approval, training_approval: { description: @training_approval.description, employee_id: @training_approval.employee_id, justification: @training_approval.justification, no_of_employee: @training_approval.no_of_employee, place: @training_approval.place, reporting_master_id: @training_approval.reporting_master_id, training_date: @training_approval.training_date, training_request_id: @training_approval.training_request_id, training_topic_master_id: @training_approval.training_topic_master_id, traininig_period: @training_approval.traininig_period }
    assert_redirected_to training_approval_path(assigns(:training_approval))
  end

  test "should destroy training_approval" do
    assert_difference('TrainingApproval.count', -1) do
      delete :destroy, id: @training_approval
    end

    assert_redirected_to training_approvals_path
  end
end
