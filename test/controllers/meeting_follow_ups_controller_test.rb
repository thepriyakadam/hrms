require 'test_helper'

class MeetingFollowUpsControllerTest < ActionController::TestCase
  setup do
    @meeting_follow_up = meeting_follow_ups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeting_follow_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting_follow_up" do
    assert_difference('MeetingFollowUp.count') do
      post :create, meeting_follow_up: { contact_no: @meeting_follow_up.contact_no, contact_person: @meeting_follow_up.contact_person, date: @meeting_follow_up.date, employee_plan_id: @meeting_follow_up.employee_plan_id, follow_up_response: @meeting_follow_up.follow_up_response, next_date: @meeting_follow_up.next_date, next_time: @meeting_follow_up.next_time, time: @meeting_follow_up.time }
    end

    assert_redirected_to meeting_follow_up_path(assigns(:meeting_follow_up))
  end

  test "should show meeting_follow_up" do
    get :show, id: @meeting_follow_up
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting_follow_up
    assert_response :success
  end

  test "should update meeting_follow_up" do
    patch :update, id: @meeting_follow_up, meeting_follow_up: { contact_no: @meeting_follow_up.contact_no, contact_person: @meeting_follow_up.contact_person, date: @meeting_follow_up.date, employee_plan_id: @meeting_follow_up.employee_plan_id, follow_up_response: @meeting_follow_up.follow_up_response, next_date: @meeting_follow_up.next_date, next_time: @meeting_follow_up.next_time, time: @meeting_follow_up.time }
    assert_redirected_to meeting_follow_up_path(assigns(:meeting_follow_up))
  end

  test "should destroy meeting_follow_up" do
    assert_difference('MeetingFollowUp.count', -1) do
      delete :destroy, id: @meeting_follow_up
    end

    assert_redirected_to meeting_follow_ups_path
  end
end
