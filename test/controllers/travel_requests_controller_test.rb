require 'test_helper'

class TravelRequestsControllerTest < ActionController::TestCase
  setup do
    @travel_request = travel_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_request" do
    assert_difference('TravelRequest.count') do
      post :create, travel_request: { application_date: @travel_request.application_date, employee_id: @travel_request.employee_id, extra_advance: @travel_request.extra_advance, lodging_boarding_advance: @travel_request.lodging_boarding_advance, place: @travel_request.place, reporting_manager_id: @travel_request.reporting_manager_id, total_advance: @travel_request.total_advance, tour_purpose: @travel_request.tour_purpose, traveling_advance: @travel_request.traveling_advance, traveling_date: @travel_request.traveling_date }
    end

    assert_redirected_to travel_request_path(assigns(:travel_request))
  end

  test "should show travel_request" do
    get :show, id: @travel_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_request
    assert_response :success
  end

  test "should update travel_request" do
    patch :update, id: @travel_request, travel_request: { application_date: @travel_request.application_date, employee_id: @travel_request.employee_id, extra_advance: @travel_request.extra_advance, lodging_boarding_advance: @travel_request.lodging_boarding_advance, place: @travel_request.place, reporting_manager_id: @travel_request.reporting_manager_id, total_advance: @travel_request.total_advance, tour_purpose: @travel_request.tour_purpose, traveling_advance: @travel_request.traveling_advance, traveling_date: @travel_request.traveling_date }
    assert_redirected_to travel_request_path(assigns(:travel_request))
  end

  test "should destroy travel_request" do
    assert_difference('TravelRequest.count', -1) do
      delete :destroy, id: @travel_request
    end

    assert_redirected_to travel_requests_path
  end
end
