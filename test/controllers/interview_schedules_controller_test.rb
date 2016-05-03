require 'test_helper'

class InterviewSchedulesControllerTest < ActionController::TestCase
  setup do
    @interview_schedule = interview_schedules(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_schedules)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create interview_schedule' do
    assert_difference('InterviewSchedule.count') do
      post :create, interview_schedule: { candidate_name: @interview_schedule.candidate_name, interview_date: @interview_schedule.interview_date, interview_status: @interview_schedule.interview_status, interview_time: @interview_schedule.interview_time, interview_type: @interview_schedule.interview_type, interviewer_name: @interview_schedule.interviewer_name, location: @interview_schedule.location, post_title: @interview_schedule.post_title, schedule_comments: @interview_schedule.schedule_comments }
    end

    assert_redirected_to interview_schedule_path(assigns(:interview_schedule))
  end

  test 'should show interview_schedule' do
    get :show, id: @interview_schedule
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @interview_schedule
    assert_response :success
  end

  test 'should update interview_schedule' do
    patch :update, id: @interview_schedule, interview_schedule: { candidate_name: @interview_schedule.candidate_name, interview_date: @interview_schedule.interview_date, interview_status: @interview_schedule.interview_status, interview_time: @interview_schedule.interview_time, interview_type: @interview_schedule.interview_type, interviewer_name: @interview_schedule.interviewer_name, location: @interview_schedule.location, post_title: @interview_schedule.post_title, schedule_comments: @interview_schedule.schedule_comments }
    assert_redirected_to interview_schedule_path(assigns(:interview_schedule))
  end

  test 'should destroy interview_schedule' do
    assert_difference('InterviewSchedule.count', -1) do
      delete :destroy, id: @interview_schedule
    end

    assert_redirected_to interview_schedules_path
  end
end
