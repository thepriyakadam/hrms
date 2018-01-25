require 'test_helper'

class SurveyDetailsControllerTest < ActionController::TestCase
  setup do
    @survey_detail = survey_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_detail" do
    assert_difference('SurveyDetail.count') do
      post :create, survey_detail: { answer_master_id: @survey_detail.answer_master_id, employee_id: @survey_detail.employee_id, survey_question_id: @survey_detail.survey_question_id }
    end

    assert_redirected_to survey_detail_path(assigns(:survey_detail))
  end

  test "should show survey_detail" do
    get :show, id: @survey_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_detail
    assert_response :success
  end

  test "should update survey_detail" do
    patch :update, id: @survey_detail, survey_detail: { answer_master_id: @survey_detail.answer_master_id, employee_id: @survey_detail.employee_id, survey_question_id: @survey_detail.survey_question_id }
    assert_redirected_to survey_detail_path(assigns(:survey_detail))
  end

  test "should destroy survey_detail" do
    assert_difference('SurveyDetail.count', -1) do
      delete :destroy, id: @survey_detail
    end

    assert_redirected_to survey_details_path
  end
end
