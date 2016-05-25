require 'test_helper'

class ExitInterviewsControllerTest < ActionController::TestCase
  setup do
    @exit_interview = exit_interviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exit_interviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exit_interview" do
    assert_difference('ExitInterview.count') do
      post :create, exit_interview: { answer: @exit_interview.answer, employee_id: @exit_interview.employee_id, question_master_id: @exit_interview.question_master_id }
    end

    assert_redirected_to exit_interview_path(assigns(:exit_interview))
  end

  test "should show exit_interview" do
    get :show, id: @exit_interview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exit_interview
    assert_response :success
  end

  test "should update exit_interview" do
    patch :update, id: @exit_interview, exit_interview: { answer: @exit_interview.answer, employee_id: @exit_interview.employee_id, question_master_id: @exit_interview.question_master_id }
    assert_redirected_to exit_interview_path(assigns(:exit_interview))
  end

  test "should destroy exit_interview" do
    assert_difference('ExitInterview.count', -1) do
      delete :destroy, id: @exit_interview
    end

    assert_redirected_to exit_interviews_path
  end
end
