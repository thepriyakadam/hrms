require 'test_helper'

class InterviewRoundsControllerTest < ActionController::TestCase
  setup do
    @interview_round = interview_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_round" do
    assert_difference('InterviewRound.count') do
      post :create, interview_round: { employee_id: @interview_round.employee_id, interview_date: @interview_round.interview_date, interview_schedule_id: @interview_round.interview_schedule_id, interview_time: @interview_round.interview_time, interview_type_id: @interview_round.interview_type_id, location: @interview_round.location, schedule_comment: @interview_round.schedule_comment }
    end

    assert_redirected_to interview_round_path(assigns(:interview_round))
  end

  test "should show interview_round" do
    get :show, id: @interview_round
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_round
    assert_response :success
  end

  test "should update interview_round" do
    patch :update, id: @interview_round, interview_round: { employee_id: @interview_round.employee_id, interview_date: @interview_round.interview_date, interview_schedule_id: @interview_round.interview_schedule_id, interview_time: @interview_round.interview_time, interview_type_id: @interview_round.interview_type_id, location: @interview_round.location, schedule_comment: @interview_round.schedule_comment }
    assert_redirected_to interview_round_path(assigns(:interview_round))
  end

  test "should destroy interview_round" do
    assert_difference('InterviewRound.count', -1) do
      delete :destroy, id: @interview_round
    end

    assert_redirected_to interview_rounds_path
  end
end
