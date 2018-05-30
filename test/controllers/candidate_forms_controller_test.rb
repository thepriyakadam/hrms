require 'test_helper'

class CandidateFormsControllerTest < ActionController::TestCase
  setup do
    @candidate_form = candidate_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_form" do
    assert_difference('CandidateForm.count') do
      post :create, candidate_form: { candidate_type: @candidate_form.candidate_type, contact_no: @candidate_form.contact_no, email: @candidate_form.email, experience: @candidate_form.experience, name: @candidate_form.name, notice_period: @candidate_form.notice_period, qualification_id: @candidate_form.qualification_id, selected_by_id: @candidate_form.selected_by_id, skill_set: @candidate_form.skill_set, vacancy_request_id: @candidate_form.vacancy_request_id }
    end

    assert_redirected_to candidate_form_path(assigns(:candidate_form))
  end

  test "should show candidate_form" do
    get :show, id: @candidate_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_form
    assert_response :success
  end

  test "should update candidate_form" do
    patch :update, id: @candidate_form, candidate_form: { candidate_type: @candidate_form.candidate_type, contact_no: @candidate_form.contact_no, email: @candidate_form.email, experience: @candidate_form.experience, name: @candidate_form.name, notice_period: @candidate_form.notice_period, qualification_id: @candidate_form.qualification_id, selected_by_id: @candidate_form.selected_by_id, skill_set: @candidate_form.skill_set, vacancy_request_id: @candidate_form.vacancy_request_id }
    assert_redirected_to candidate_form_path(assigns(:candidate_form))
  end

  test "should destroy candidate_form" do
    assert_difference('CandidateForm.count', -1) do
      delete :destroy, id: @candidate_form
    end

    assert_redirected_to candidate_forms_path
  end
end
