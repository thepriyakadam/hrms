require 'test_helper'

class SelectedResumesControllerTest < ActionController::TestCase
  setup do
    @selected_resume = selected_resumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selected_resumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selected_resume" do
    assert_difference('SelectedResume.count') do
      post :create, selected_resume: { contact_no: @selected_resume.contact_no, ctc: @selected_resume.ctc, degree_id: @selected_resume.degree_id, email_id: @selected_resume.email_id, experience: @selected_resume.experience, name: @selected_resume.name, notice_period: @selected_resume.notice_period, skillset: @selected_resume.skillset, vacancy_master_id: @selected_resume.vacancy_master_id }
    end

    assert_redirected_to selected_resume_path(assigns(:selected_resume))
  end

  test "should show selected_resume" do
    get :show, id: @selected_resume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selected_resume
    assert_response :success
  end

  test "should update selected_resume" do
    patch :update, id: @selected_resume, selected_resume: { contact_no: @selected_resume.contact_no, ctc: @selected_resume.ctc, degree_id: @selected_resume.degree_id, email_id: @selected_resume.email_id, experience: @selected_resume.experience, name: @selected_resume.name, notice_period: @selected_resume.notice_period, skillset: @selected_resume.skillset, vacancy_master_id: @selected_resume.vacancy_master_id }
    assert_redirected_to selected_resume_path(assigns(:selected_resume))
  end

  test "should destroy selected_resume" do
    assert_difference('SelectedResume.count', -1) do
      delete :destroy, id: @selected_resume
    end

    assert_redirected_to selected_resumes_path
  end
end
