require 'test_helper'

class TravelExpencesControllerTest < ActionController::TestCase
  setup do
    @travel_expence = travel_expences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_expences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_expence" do
    assert_difference('TravelExpence.count') do
      post :create, travel_expence: { company_amount: @travel_expence.company_amount, employee_amount: @travel_expence.employee_amount, remaining_amount: @travel_expence.remaining_amount, total_advance_amount: @travel_expence.total_advance_amount, total_expence_amount: @travel_expence.total_expence_amount, travel_request_id: @travel_expence.travel_request_id }
    end

    assert_redirected_to travel_expence_path(assigns(:travel_expence))
  end

  test "should show travel_expence" do
    get :show, id: @travel_expence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_expence
    assert_response :success
  end

  test "should update travel_expence" do
    patch :update, id: @travel_expence, travel_expence: { company_amount: @travel_expence.company_amount, employee_amount: @travel_expence.employee_amount, remaining_amount: @travel_expence.remaining_amount, total_advance_amount: @travel_expence.total_advance_amount, total_expence_amount: @travel_expence.total_expence_amount, travel_request_id: @travel_expence.travel_request_id }
    assert_redirected_to travel_expence_path(assigns(:travel_expence))
  end

  test "should destroy travel_expence" do
    assert_difference('TravelExpence.count', -1) do
      delete :destroy, id: @travel_expence
    end

    assert_redirected_to travel_expences_path
  end
end
