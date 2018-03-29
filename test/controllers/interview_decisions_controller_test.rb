require 'test_helper'

class InterviewDecisionsControllerTest < ActionController::TestCase
  setup do
    @interview_decision = interview_decisions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_decisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_decision" do
    assert_difference('InterviewDecision.count') do
      post :create, interview_decision: { code: @interview_decision.code, description: @interview_decision.description, name: @interview_decision.name }
    end

    assert_redirected_to interview_decision_path(assigns(:interview_decision))
  end

  test "should show interview_decision" do
    get :show, id: @interview_decision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_decision
    assert_response :success
  end

  test "should update interview_decision" do
    patch :update, id: @interview_decision, interview_decision: { code: @interview_decision.code, description: @interview_decision.description, name: @interview_decision.name }
    assert_redirected_to interview_decision_path(assigns(:interview_decision))
  end

  test "should destroy interview_decision" do
    assert_difference('InterviewDecision.count', -1) do
      delete :destroy, id: @interview_decision
    end

    assert_redirected_to interview_decisions_path
  end
end
