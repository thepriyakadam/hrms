require 'test_helper'

class CaptureResumesControllerTest < ActionController::TestCase
  setup do
    @capture_resume = capture_resumes(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:capture_resumes)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create capture_resume' do
    assert_difference('CaptureResume.count') do
      post :create, capture_resume: { additional_info: @capture_resume.additional_info, candidate_call_status: @capture_resume.candidate_call_status, city: @capture_resume.city, country: @capture_resume.country, current_employeer: @capture_resume.current_employeer, current_job_title: @capture_resume.current_job_title, current_location: @capture_resume.current_location, current_salary: @capture_resume.current_salary, date_of_application: @capture_resume.date_of_application, district: @capture_resume.district, email: @capture_resume.email, expected_salary: @capture_resume.expected_salary, fax: @capture_resume.fax, interview_date: @capture_resume.interview_date, interview_time: @capture_resume.interview_time, mode_of_application: @capture_resume.mode_of_application, name_of_candidate: @capture_resume.name_of_candidate, notice_period: @capture_resume.notice_period, post_applied: @capture_resume.post_applied, reason: @capture_resume.reason, skill_set: @capture_resume.skill_set, skype_id: @capture_resume.skype_id, state: @capture_resume.state, street: @capture_resume.street, twitter: @capture_resume.twitter, url: @capture_resume.url, work_experience: @capture_resume.work_experience, zip_code: @capture_resume.zip_code }
    end

    assert_redirected_to capture_resume_path(assigns(:capture_resume))
  end

  test 'should show capture_resume' do
    get :show, id: @capture_resume
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @capture_resume
    assert_response :success
  end

  test 'should update capture_resume' do
    patch :update, id: @capture_resume, capture_resume: { additional_info: @capture_resume.additional_info, candidate_call_status: @capture_resume.candidate_call_status, city: @capture_resume.city, country: @capture_resume.country, current_employeer: @capture_resume.current_employeer, current_job_title: @capture_resume.current_job_title, current_location: @capture_resume.current_location, current_salary: @capture_resume.current_salary, date_of_application: @capture_resume.date_of_application, district: @capture_resume.district, email: @capture_resume.email, expected_salary: @capture_resume.expected_salary, fax: @capture_resume.fax, interview_date: @capture_resume.interview_date, interview_time: @capture_resume.interview_time, mode_of_application: @capture_resume.mode_of_application, name_of_candidate: @capture_resume.name_of_candidate, notice_period: @capture_resume.notice_period, post_applied: @capture_resume.post_applied, reason: @capture_resume.reason, skill_set: @capture_resume.skill_set, skype_id: @capture_resume.skype_id, state: @capture_resume.state, street: @capture_resume.street, twitter: @capture_resume.twitter, url: @capture_resume.url, work_experience: @capture_resume.work_experience, zip_code: @capture_resume.zip_code }
    assert_redirected_to capture_resume_path(assigns(:capture_resume))
  end

  test 'should destroy capture_resume' do
    assert_difference('CaptureResume.count', -1) do
      delete :destroy, id: @capture_resume
    end

    assert_redirected_to capture_resumes_path
  end
end
