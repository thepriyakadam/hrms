require 'test_helper'

class CompanyEventsControllerTest < ActionController::TestCase
  setup do
    @company_event = company_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_event" do
    assert_difference('CompanyEvent.count') do
      post :create, company_event: { event_date: @company_event.event_date, event_name: @company_event.event_name, location: @company_event.location, status: @company_event.status, time: @company_event.time }
    end

    assert_redirected_to company_event_path(assigns(:company_event))
  end

  test "should show company_event" do
    get :show, id: @company_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_event
    assert_response :success
  end

  test "should update company_event" do
    patch :update, id: @company_event, company_event: { event_date: @company_event.event_date, event_name: @company_event.event_name, location: @company_event.location, status: @company_event.status, time: @company_event.time }
    assert_redirected_to company_event_path(assigns(:company_event))
  end

  test "should destroy company_event" do
    assert_difference('CompanyEvent.count', -1) do
      delete :destroy, id: @company_event
    end

    assert_redirected_to company_events_path
  end
end
