require 'test_helper'

class WorkingdaysControllerTest < ActionController::TestCase
  setup do
    @workingday = workingdays(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:workingdays)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create workingday' do
    assert_difference('Workingday.count') do
      post :create, workingday: { absent_day: @workingday.absent_day, day_in_month: @workingday.day_in_month, employee_id: @workingday.employee_id, holiday_in_month: @workingday.holiday_in_month, month_name: @workingday.month_name, payable_day: @workingday.payable_day, present_day: @workingday.present_day, total_leave: @workingday.total_leave, week_off_day: @workingday.week_off_day, year: @workingday.year }
    end

    assert_redirected_to workingday_path(assigns(:workingday))
  end

  test 'should show workingday' do
    get :show, id: @workingday
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @workingday
    assert_response :success
  end

  test 'should update workingday' do
    patch :update, id: @workingday, workingday: { absent_day: @workingday.absent_day, day_in_month: @workingday.day_in_month, employee_id: @workingday.employee_id, holiday_in_month: @workingday.holiday_in_month, month_name: @workingday.month_name, payable_day: @workingday.payable_day, present_day: @workingday.present_day, total_leave: @workingday.total_leave, week_off_day: @workingday.week_off_day, year: @workingday.year }
    assert_redirected_to workingday_path(assigns(:workingday))
  end

  test 'should destroy workingday' do
    assert_difference('Workingday.count', -1) do
      delete :destroy, id: @workingday
    end

    assert_redirected_to workingdays_path
  end
end
