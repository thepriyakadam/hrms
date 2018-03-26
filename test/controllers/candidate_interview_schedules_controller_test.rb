require 'test_helper'

class CandidateInterviewSchedulesControllerTest < ActionController::TestCase
  setup do
    @candidate_interview_schedule = candidate_interview_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_interview_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_interview_schedule" do
    assert_difference('CandidateInterviewSchedule.count') do
      post :create, candidate_interview_schedule: { address: @candidate_interview_schedule.address, candidate_form_id: @candidate_interview_schedule.candidate_form_id, date: @candidate_interview_schedule.date, description: @candidate_interview_schedule.description, interview_type_master_id: @candidate_interview_schedule.interview_type_master_id, interviewer_id: @candidate_interview_schedule.interviewer_id, place: @candidate_interview_schedule.place, time: @candidate_interview_schedule.time }
    end

    assert_redirected_to candidate_interview_schedule_path(assigns(:candidate_interview_schedule))
  end

  test "should show candidate_interview_schedule" do
    get :show, id: @candidate_interview_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_interview_schedule
    assert_response :success
  end

  test "should update candidate_interview_schedule" do
    patch :update, id: @candidate_interview_schedule, candidate_interview_schedule: { address: @candidate_interview_schedule.address, candidate_form_id: @candidate_interview_schedule.candidate_form_id, date: @candidate_interview_schedule.date, description: @candidate_interview_schedule.description, interview_type_master_id: @candidate_interview_schedule.interview_type_master_id, interviewer_id: @candidate_interview_schedule.interviewer_id, place: @candidate_interview_schedule.place, time: @candidate_interview_schedule.time }
    assert_redirected_to candidate_interview_schedule_path(assigns(:candidate_interview_schedule))
  end

  test "should destroy candidate_interview_schedule" do
    assert_difference('CandidateInterviewSchedule.count', -1) do
      delete :destroy, id: @candidate_interview_schedule
    end

    assert_redirected_to candidate_interview_schedules_path
  end
end
