require 'test_helper'

class FrequestQuestionsControllerTest < ActionController::TestCase
  setup do
    @frequest_question = frequest_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequest_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequest_question" do
    assert_difference('FrequestQuestion.count') do
      post :create, frequest_question: { answer: @frequest_question.answer, code: @frequest_question.code, employee_id: @frequest_question.employee_id, question: @frequest_question.question, status: @frequest_question.status }
    end

    assert_redirected_to frequest_question_path(assigns(:frequest_question))
  end

  test "should show frequest_question" do
    get :show, id: @frequest_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frequest_question
    assert_response :success
  end

  test "should update frequest_question" do
    patch :update, id: @frequest_question, frequest_question: { answer: @frequest_question.answer, code: @frequest_question.code, employee_id: @frequest_question.employee_id, question: @frequest_question.question, status: @frequest_question.status }
    assert_redirected_to frequest_question_path(assigns(:frequest_question))
  end

  test "should destroy frequest_question" do
    assert_difference('FrequestQuestion.count', -1) do
      delete :destroy, id: @frequest_question
    end

    assert_redirected_to frequest_questions_path
  end
end
