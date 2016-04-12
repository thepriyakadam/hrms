require 'test_helper'

class LeaveCOffsControllerTest < ActionController::TestCase
  setup do
    @leave_c_off = leave_c_offs(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_c_offs)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create leave_c_off' do
    assert_difference('LeaveCOff.count') do
      post :create, leave_c_off: { c_off_date: @leave_c_off.c_off_date, c_off_expire_day: @leave_c_off.c_off_expire_day, c_off_type: @leave_c_off.c_off_type, employee_id: @leave_c_off.employee_id, expiry_status: @leave_c_off.expiry_status }
    end

    assert_redirected_to leave_c_off_path(assigns(:leave_c_off))
  end

  test 'should show leave_c_off' do
    get :show, id: @leave_c_off
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @leave_c_off
    assert_response :success
  end

  test 'should update leave_c_off' do
    patch :update, id: @leave_c_off, leave_c_off: { c_off_date: @leave_c_off.c_off_date, c_off_expire_day: @leave_c_off.c_off_expire_day, c_off_type: @leave_c_off.c_off_type, employee_id: @leave_c_off.employee_id, expiry_status: @leave_c_off.expiry_status }
    assert_redirected_to leave_c_off_path(assigns(:leave_c_off))
  end

  test 'should destroy leave_c_off' do
    assert_difference('LeaveCOff.count', -1) do
      delete :destroy, id: @leave_c_off
    end

    assert_redirected_to leave_c_offs_path
  end
end
