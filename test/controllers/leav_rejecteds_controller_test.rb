require 'test_helper'

class LeavRejectedsControllerTest < ActionController::TestCase
  setup do
    @leav_rejected = leav_rejecteds(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_rejecteds)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create leav_rejected' do
    assert_difference('LeavRejected.count') do
      post :create, leav_rejected: { employee_leav_request_id: @leav_rejected.employee_leav_request_id, rejected_date: @leav_rejected.rejected_date }
    end

    assert_redirected_to leav_rejected_path(assigns(:leav_rejected))
  end

  test 'should show leav_rejected' do
    get :show, id: @leav_rejected
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @leav_rejected
    assert_response :success
  end

  test 'should update leav_rejected' do
    patch :update, id: @leav_rejected, leav_rejected: { employee_leav_request_id: @leav_rejected.employee_leav_request_id, rejected_date: @leav_rejected.rejected_date }
    assert_redirected_to leav_rejected_path(assigns(:leav_rejected))
  end

  test 'should destroy leav_rejected' do
    assert_difference('LeavRejected.count', -1) do
      delete :destroy, id: @leav_rejected
    end

    assert_redirected_to leav_rejecteds_path
  end
end
