require 'test_helper'

class LeavCancelledsControllerTest < ActionController::TestCase
  setup do
    @leav_cancelled = leav_cancelleds(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_cancelleds)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create leav_cancelled' do
    assert_difference('LeavCancelled.count') do
      post :create, leav_cancelled: { cancelled_date: @leav_cancelled.cancelled_date, employee_leav_request_id: @leav_cancelled.employee_leav_request_id }
    end

    assert_redirected_to leav_cancelled_path(assigns(:leav_cancelled))
  end

  test 'should show leav_cancelled' do
    get :show, id: @leav_cancelled
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @leav_cancelled
    assert_response :success
  end

  test 'should update leav_cancelled' do
    patch :update, id: @leav_cancelled, leav_cancelled: { cancelled_date: @leav_cancelled.cancelled_date, employee_leav_request_id: @leav_cancelled.employee_leav_request_id }
    assert_redirected_to leav_cancelled_path(assigns(:leav_cancelled))
  end

  test 'should destroy leav_cancelled' do
    assert_difference('LeavCancelled.count', -1) do
      delete :destroy, id: @leav_cancelled
    end

    assert_redirected_to leav_cancelleds_path
  end
end
