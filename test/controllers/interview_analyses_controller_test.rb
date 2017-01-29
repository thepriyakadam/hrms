require 'test_helper'

class InterviewAnalysesControllerTest < ActionController::TestCase
  setup do
    @interview_analysis = interview_analyses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_analyses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_analysis" do
    assert_difference('InterviewAnalysis.count') do
      post :create, interview_analysis: { comment: @interview_analysis.comment, interview_attribute_id: @interview_analysis.interview_attribute_id, interview_decision_id: @interview_analysis.interview_decision_id, interview_evalution_id: @interview_analysis.interview_evalution_id, vacancy_request_history_id: @interview_analysis.vacancy_request_history_id }
    end

    assert_redirected_to interview_analysis_path(assigns(:interview_analysis))
  end

  test "should show interview_analysis" do
    get :show, id: @interview_analysis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_analysis
    assert_response :success
  end

  test "should update interview_analysis" do
    patch :update, id: @interview_analysis, interview_analysis: { comment: @interview_analysis.comment, interview_attribute_id: @interview_analysis.interview_attribute_id, interview_decision_id: @interview_analysis.interview_decision_id, interview_evalution_id: @interview_analysis.interview_evalution_id, vacancy_request_history_id: @interview_analysis.vacancy_request_history_id }
    assert_redirected_to interview_analysis_path(assigns(:interview_analysis))
  end

  test "should destroy interview_analysis" do
    assert_difference('InterviewAnalysis.count', -1) do
      delete :destroy, id: @interview_analysis
    end

    assert_redirected_to interview_analyses_path
  end
end
