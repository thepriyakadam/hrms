require 'test_helper'

class LeaveTravelAssistancesControllerTest < ActionController::TestCase
  setup do
    @leave_travel_assistance = leave_travel_assistances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_travel_assistances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_travel_assistance" do
    assert_difference('LeaveTravelAssistance.count') do
      post :create, leave_travel_assistance: { actual_amt: @leave_travel_assistance.actual_amt, estimated_amt: @leave_travel_assistance.estimated_amt, from_location: @leave_travel_assistance.from_location, investment_declaration_id: @leave_travel_assistance.investment_declaration_id, journey_from_date: @leave_travel_assistance.journey_from_date, journey_to_date: @leave_travel_assistance.journey_to_date, person_traveled: @leave_travel_assistance.person_traveled, relationship: @leave_travel_assistance.relationship, to_location: @leave_travel_assistance.to_location, total: @leave_travel_assistance.total, travel_mode: @leave_travel_assistance.travel_mode }
    end

    assert_redirected_to leave_travel_assistance_path(assigns(:leave_travel_assistance))
  end

  test "should show leave_travel_assistance" do
    get :show, id: @leave_travel_assistance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_travel_assistance
    assert_response :success
  end

  test "should update leave_travel_assistance" do
    patch :update, id: @leave_travel_assistance, leave_travel_assistance: { actual_amt: @leave_travel_assistance.actual_amt, estimated_amt: @leave_travel_assistance.estimated_amt, from_location: @leave_travel_assistance.from_location, investment_declaration_id: @leave_travel_assistance.investment_declaration_id, journey_from_date: @leave_travel_assistance.journey_from_date, journey_to_date: @leave_travel_assistance.journey_to_date, person_traveled: @leave_travel_assistance.person_traveled, relationship: @leave_travel_assistance.relationship, to_location: @leave_travel_assistance.to_location, total: @leave_travel_assistance.total, travel_mode: @leave_travel_assistance.travel_mode }
    assert_redirected_to leave_travel_assistance_path(assigns(:leave_travel_assistance))
  end

  test "should destroy leave_travel_assistance" do
    assert_difference('LeaveTravelAssistance.count', -1) do
      delete :destroy, id: @leave_travel_assistance
    end

    assert_redirected_to leave_travel_assistances_path
  end
end
