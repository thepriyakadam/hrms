require 'test_helper'

class InterviewEvalutionsControllerTest < ActionController::TestCase
  setup do
    @interview_evalution = interview_evalutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_evalutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_evalution" do
    assert_difference('InterviewEvalution.count') do
      post :create, interview_evalution: { code: @interview_evalution.code, description: @interview_evalution.description, name: @interview_evalution.name }
    end

    assert_redirected_to interview_evalution_path(assigns(:interview_evalution))
  end

  test "should show interview_evalution" do
    get :show, id: @interview_evalution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_evalution
    assert_response :success
  end

  test "should update interview_evalution" do
    patch :update, id: @interview_evalution, interview_evalution: { code: @interview_evalution.code, description: @interview_evalution.description, name: @interview_evalution.name }
    assert_redirected_to interview_evalution_path(assigns(:interview_evalution))
  end

  test "should destroy interview_evalution" do
    assert_difference('InterviewEvalution.count', -1) do
      delete :destroy, id: @interview_evalution
    end

    assert_redirected_to interview_evalutions_path
  end
end
