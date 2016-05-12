require 'test_helper'

class TrainingRequestsControllerTest < ActionController::TestCase
  setup do
    @training_request = training_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_request" do
    assert_difference('TrainingRequest.count') do
      post :create, training_request: { description: @training_request.description, employee_id: @training_request.employee_id, reporting_master_id: @training_request.reporting_master_id, training_date: @training_request.training_date, training_period: @training_request.training_period, training_topic: @training_request.training_topic }
    end

    assert_redirected_to training_request_path(assigns(:training_request))
  end

  test "should show training_request" do
    get :show, id: @training_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_request
    assert_response :success
  end

  test "should update training_request" do
    patch :update, id: @training_request, training_request: { description: @training_request.description, employee_id: @training_request.employee_id, reporting_master_id: @training_request.reporting_master_id, training_date: @training_request.training_date, training_period: @training_request.training_period, training_topic: @training_request.training_topic }
    assert_redirected_to training_request_path(assigns(:training_request))
  end

  test "should destroy training_request" do
    assert_difference('TrainingRequest.count', -1) do
      delete :destroy, id: @training_request
    end

    assert_redirected_to training_requests_path
  end
end
