require 'test_helper'

class DailyBillDetailsControllerTest < ActionController::TestCase
  setup do
    @daily_bill_detail = daily_bill_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_bill_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_bill_detail" do
    assert_difference('DailyBillDetail.count') do
      post :create, daily_bill_detail: { boarding_expence: @daily_bill_detail.boarding_expence, e_place: @daily_bill_detail.e_place, expence_date: @daily_bill_detail.expence_date, local_travel_expence: @daily_bill_detail.local_travel_expence, lodging_expence: @daily_bill_detail.lodging_expence, other_expence: @daily_bill_detail.other_expence, travel_expence: @daily_bill_detail.travel_expence, travel_request_id: @daily_bill_detail.travel_request_id }
    end

    assert_redirected_to daily_bill_detail_path(assigns(:daily_bill_detail))
  end

  test "should show daily_bill_detail" do
    get :show, id: @daily_bill_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_bill_detail
    assert_response :success
  end

  test "should update daily_bill_detail" do
    patch :update, id: @daily_bill_detail, daily_bill_detail: { boarding_expence: @daily_bill_detail.boarding_expence, e_place: @daily_bill_detail.e_place, expence_date: @daily_bill_detail.expence_date, local_travel_expence: @daily_bill_detail.local_travel_expence, lodging_expence: @daily_bill_detail.lodging_expence, other_expence: @daily_bill_detail.other_expence, travel_expence: @daily_bill_detail.travel_expence, travel_request_id: @daily_bill_detail.travel_request_id }
    assert_redirected_to daily_bill_detail_path(assigns(:daily_bill_detail))
  end

  test "should destroy daily_bill_detail" do
    assert_difference('DailyBillDetail.count', -1) do
      delete :destroy, id: @daily_bill_detail
    end

    assert_redirected_to daily_bill_details_path
  end
end
